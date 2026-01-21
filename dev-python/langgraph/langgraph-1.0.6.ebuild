EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Building stateful, multi-actor applications with LLMs"
HOMEPAGE="https://github.com/langchain-ai/langgraph https://docs.langchain.com/langgraph"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

# Required dependencies per metadata :contentReference[oaicite:2]{index=2}
RDEPEND="
	dev-python/langchain-core[${PYTHON_USEDEP}]
	dev-python/langgraph-checkpoint[${PYTHON_USEDEP}]
	dev-python/langgraph-prebuilt[${PYTHON_USEDEP}]
	dev-python/langgraph-sdk[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/xxhash[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"

RESTRICT="test"
