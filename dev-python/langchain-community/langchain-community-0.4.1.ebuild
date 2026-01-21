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
	>=dev-python/aiohttp-3.9[${PYTHON_USEDEP}]
	>=dev-python/dataclasses-json-0.6[${PYTHON_USEDEP}]
	>=dev-python/httpx-sse-0.4[${PYTHON_USEDEP}]
	>=dev-python/langchain-core-1.0.0[${PYTHON_USEDEP}]
	<dev-python/langchain-core-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/langsmith-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.24[${PYTHON_USEDEP}]
	>=dev-python/pydantic-settings-2.1[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31[${PYTHON_USEDEP}]
	>=dev-python/sqlalchemy-2.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2[${PYTHON_USEDEP}]
	>=dev-python/langchain-1.0.0[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/hatchling-1.20[${PYTHON_USEDEP}]
"

RESTRICT="test"
