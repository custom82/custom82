EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Community contributed LangChain integrations"
HOMEPAGE="https://python.langchain.com/ https://github.com/langchain-ai/langchain"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

# NB: a monte spesso compare anche "langchain-classic"; in Gentoo tipicamente
# lo tratti come il pacchetto principale dev-python/langchain.
RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/dataclasses-json[${PYTHON_USEDEP}]
	dev-python/httpx-sse[${PYTHON_USEDEP}]
	dev-python/langchain-core[${PYTHON_USEDEP}]
	dev-python/langchain-core[${PYTHON_USEDEP}]
	dev-python/langsmith[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pydantic-settings[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/sqlalchemy[${PYTHON_USEDEP}]
	dev-python/tenacity[${PYTHON_USEDEP}]
	dev-python/langchain[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/hatchling-1.20[${PYTHON_USEDEP}]
"

RESTRICT="test"
