EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

# Stack LangChain/LangGraph recente: tipicamente hatchling.
# (Se nel tuo sistema hai ancora un override globale che forza setuptools,
# sistemalo via package.env, altrimenti avrai mismatch PEP517.)
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Base interfaces for LangGraph checkpoint savers"
HOMEPAGE="https://pypi.org/project/langgraph-checkpoint/"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/langchain-core-1.0.0[${PYTHON_USEDEP}]
	<dev-python/langchain-core-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/ormsgpack-1.0.0[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/hatchling-1.20[${PYTHON_USEDEP}]
"

RESTRICT="test"
