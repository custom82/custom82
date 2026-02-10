EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Core interfaces and abstractions for LangChain"
HOMEPAGE="https://github.com/langchain-ai/langchain"

SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/langchain==${PV}.tar.gz
    -> langchain-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/langchain-langchain-${PV}/libs/core"

RDEPEND="
    $(python_gen_cond_dep '
        >=dev-python/pydantic-2.7.4[${PYTHON_USEDEP}]
        >=dev-python/jsonpatch-1.33[${PYTHON_USEDEP}]
        >=dev-python/langsmith-0.1.17[${PYTHON_USEDEP}]
        >=dev-python/packaging-23.2[${PYTHON_USEDEP}]
        >=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
        >=dev-python/tenacity-8.2.3[${PYTHON_USEDEP}]
        >=dev-python/typing-extensions-4.7.0[${PYTHON_USEDEP}]
    ')
"

BDEPEND="
    ${RDEPEND}
"
