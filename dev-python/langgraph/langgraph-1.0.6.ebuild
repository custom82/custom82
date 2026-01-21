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
	>=dev-python/langchain-core-1.0.0[${PYTHON_USEDEP}]


	>=dev-python/langgraph-checkpoint-1.0.0[${PYTHON_USEDEP}]


	>=dev-python/langgraph-prebuilt-1.0.0[${PYTHON_USEDEP}]


	>=dev-python/langgraph-sdk-1.0.0[${PYTHON_USEDEP}]


	>=dev-python/pydantic-2.5[${PYTHON_USEDEP}]
	>=dev-python/xxhash-3.4.1[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/hatchling-1.20[${PYTHON_USEDEP}]
"

RESTRICT="test"
