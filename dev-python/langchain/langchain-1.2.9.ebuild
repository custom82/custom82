EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Building applications with LLMs through composability"
HOMEPAGE="https://github.com/langchain-ai/langchain"

SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/langchain-core==${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/langchain-langchain-${PV}/libs/langchain"

RDEPEND="
    >=dev-python/pydantic-2[${PYTHON_USEDEP}]
    >=dev-python/pyyaml-6[${PYTHON_USEDEP}]
    >=dev-python/requests-2.31[${PYTHON_USEDEP}]
    >=dev-python/tenacity-8[${PYTHON_USEDEP}]
    >=dev-python/dataclasses-json-0.6[${PYTHON_USEDEP}]
    >=dev-python/jsonpatch-1.33[${PYTHON_USEDEP}]
    >=dev-python/langsmith-0.1[${PYTHON_USEDEP}]
    >=dev-python/numpy-1.26[${PYTHON_USEDEP}]
"

BDEPEND="
    >=dev-python/hatchling-1.18[${PYTHON_USEDEP}]
"
