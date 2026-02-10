EAPI=8

PYTHON_COMPAT=( python3_{10,11,12,13,14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Model Context Protocol (MCP) Python SDK"
HOMEPAGE="https://modelcontextprotocol.io/ https://github.com/modelcontextprotocol/python-sdk"
SRC_URI="https://github.com/modelcontextprotocol/python-sdk/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="cli rich ws kernel_winnt"

# test deps non stabilizzate qui
RESTRICT="test"

S="${WORKDIR}/python-sdk-${PV}"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/anyio-0[${PYTHON_USEDEP}]
		>=dev-python/httpx-0[${PYTHON_USEDEP}]
		>=dev-python/httpx-sse-0[${PYTHON_USEDEP}]
		>=dev-python/jsonschema-0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-settings-0[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-0[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0[${PYTHON_USEDEP}]
		>=dev-python/sse-starlette-0[${PYTHON_USEDEP}]
		>=dev-python/starlette-0[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-0[${PYTHON_USEDEP}]
		>=dev-python/typing-inspection-0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0[${PYTHON_USEDEP}]

		cli? ( >=dev-python/typer-0[${PYTHON_USEDEP}] )
		rich? ( >=dev-python/rich-0[${PYTHON_USEDEP}] )
		ws? ( >=dev-python/websockets-0[${PYTHON_USEDEP}] )

		kernel_winnt? ( >=dev-python/pywin32-0[${PYTHON_USEDEP}] )
	')
"

BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/hatchling-0[${PYTHON_USEDEP}]
	')
"

src_prepare() {
	default

	# L'archive GitHub non ha .git, quindi uv-dynamic-versioning non può calcolare la versione.
	# Rendiamo la versione statica, così hatchling non deve caricare il plugin.
	#
	# 1) rimuove dynamic = ["version"] (se presente)
	sed -i -e '/^[[:space:]]*dynamic[[:space:]]*=[[:space:]]*\[[^]]*"version"[^]]*\][[:space:]]*$/d' \
		pyproject.toml || die

	# 2) aggiunge version = "${PV}" dentro la sezione [project] se non già presente
	grep -qE '^[[:space:]]*version[[:space:]]*=' pyproject.toml || \
		sed -i -e "/^\[project\]$/a version = \"${PV}\"" pyproject.toml || die

	# 3) elimina la config hatch che punta al plugin uv-dynamic-versioning
	#    (rimuove il blocco [tool.hatch.version] ... fino alla prossima sezione [..] o EOF)
	sed -i -e '/^\[tool\.hatch\.version\]$/,/^\[/{/^\[tool\.hatch\.version\]$/d; /^\[/{b}; d; }' \
		pyproject.toml || die
}

python_install_all() {
	distutils-r1_python_install_all
	dodoc README.md || die
}
