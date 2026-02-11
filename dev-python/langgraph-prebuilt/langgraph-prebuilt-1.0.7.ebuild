# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

MY_TAG="1.0.8"

DESCRIPTION="High-level APIs for creating and executing LangGraph agents and tools"
HOMEPAGE="
	https://github.com/langchain-ai/langgraph/tree/main/libs/prebuilt
	https://pypi.org/project/langgraph-prebuilt/
"
SRC_URI="https://github.com/langchain-ai/langgraph/archive/refs/tags/${MY_TAG}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

S="${WORKDIR}/langgraph-${MY_TAG}/libs/prebuilt"

RESTRICT="test"

RDEPEND="
	>=dev-python/langgraph-checkpoint-2.1.0[${PYTHON_USEDEP}]
	>=dev-python/langchain-core-1.0.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_prepare_all() {
	distutils-r1_python_prepare_all
}
