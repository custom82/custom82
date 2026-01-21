EAPI=8

PYTHON_COMPAT=( python3_{10..14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="High-level APIs for creating and executing LangGraph agents and tools"
HOMEPAGE="https://github.com/langchain-ai/langgraph https://docs.langchain.com/langgraph"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
	dev-python/langchain-core[${PYTHON_USEDEP}]
	dev-python/langgraph-checkpoint[${PYTHON_USEDEP}]

"

BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"

RESTRICT="test"
