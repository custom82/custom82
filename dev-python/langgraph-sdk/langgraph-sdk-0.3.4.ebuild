EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="SDK for interacting with LangGraph API"
HOMEPAGE="https://github.com/langchain-ai/langgraph/tree/main/libs/sdk-py"

# Il pacchetto python è 0.3.4 ma sta nel monorepo tag 1.0.8
MY_LANGGRAPH_TAG="1.0.8"
SRC_URI="https://github.com/langchain-ai/langgraph/archive/refs/tags/${MY_LANGGRAPH_TAG}.tar.gz -> langgraph-${MY_LANGGRAPH_TAG}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# pyproject.toml sta qui
S="${WORKDIR}/langgraph-${MY_LANGGRAPH_TAG}/libs/sdk-py"

RDEPEND="
	>=dev-python/httpx-0.25.2[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.10.1[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"
