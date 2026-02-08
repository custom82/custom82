EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="GenAI Python SDK (Google GenAI Python SDK)"
HOMEPAGE="https://github.com/googleapis/python-genai"
SRC_URI="https://github.com/googleapis/python-genai/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="aiohttp local-tokenizer test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/anyio-4.8.0[${PYTHON_USEDEP}]
	<dev-python/anyio-5.0.0[${PYTHON_USEDEP}]

	>=dev-python/google-auth-2.47.0[requests,${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0[requests,${PYTHON_USEDEP}]

	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	<dev-python/httpx-1.0.0[${PYTHON_USEDEP}]

	>=dev-python/pydantic-2.9.0[${PYTHON_USEDEP}]
	<dev-python/pydantic-3.0.0[${PYTHON_USEDEP}]

	>=dev-python/requests-2.28.1[${PYTHON_USEDEP}]
	<dev-python/requests-3.0.0[${PYTHON_USEDEP}]

	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]
	<dev-python/tenacity-9.2.0[${PYTHON_USEDEP}]

	>=dev-python/websockets-13.0.0[${PYTHON_USEDEP}]
	<dev-python/websockets-15.1.0[${PYTHON_USEDEP}]

	>=dev-python/typing-extensions-4.11.0[${PYTHON_USEDEP}]
	<dev-python/typing-extensions-5.0.0[${PYTHON_USEDEP}]

	>=dev-python/distro-1.7.0[${PYTHON_USEDEP}]
	<dev-python/distro-2[${PYTHON_USEDEP}]

	dev-python/sniffio[${PYTHON_USEDEP}]

	aiohttp? ( <dev-python/aiohttp-3.13.3[${PYTHON_USEDEP}] )

	local-tokenizer? (
		>=dev-python/sentencepiece-0.2.0[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
	)
"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
"

S="${WORKDIR}/python-genai-${PV}"

src_prepare() {
	default

	# Upstream pyproject.toml lacks build-system.build-backend, but distutils-r1 needs it.
	if ! grep -q '^build-backend *= *' pyproject.toml ; then
		sed -i \
			'/^\[build-system\]/a build-backend = "setuptools.build_meta"' \
			pyproject.toml || die
	fi
}

distutils_enable_tests pytest

python_test() {
	epytest -q
}
