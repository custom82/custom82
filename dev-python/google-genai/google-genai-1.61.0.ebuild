EAPI=8

PYTHON_COMPAT=( python3_{10,11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Google Gen AI Python SDK (Gemini Developer API + Vertex AI)"
HOMEPAGE="
	https://pypi.org/project/google-genai/
	https://github.com/googleapis/python-genai
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="aiohttp local-tokenizer"

RESTRICT="test"

RDEPEND="
	>=dev-python/anyio-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.47.0[requests,${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.9.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.28.1[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]
	>=dev-python/websockets-13.0.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.11.0[${PYTHON_USEDEP}]
	>=dev-python/distro-1.7.0[${PYTHON_USEDEP}]
	dev-python/sniffio[${PYTHON_USEDEP}]
	aiohttp? ( dev-python/aiohttp[${PYTHON_USEDEP}] )
	local-tokenizer? (
		>=dev-python/sentencepiece-0.2.0[${PYTHON_USEDEP}]
		dev-python/protobuf[${PYTHON_USEDEP}]
	)
"

src_prepare() {
	default

	# upstream pyproject.toml omette build-backend -> PEP517 non determinabile
	if ! grep -q '^\s*build-backend\s*=' pyproject.toml ; then
		sed -i '/^\[build-system\]/a build-backend = "setuptools.build_meta"' \
			pyproject.toml || die
	fi
}
