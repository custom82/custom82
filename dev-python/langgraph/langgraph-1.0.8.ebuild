# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11,12,13} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Building stateful, multi-actor applications with LLMs"
HOMEPAGE="https://github.com/langchain-ai/langgraph https://pypi.org/project/langgraph/"
SRC_URI="https://github.com/langchain-ai/langgraph/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

S="${WORKDIR}/langgraph-${PV}/libs/langgraph"

RDEPEND="
	>=dev-python/langchain-core-0.3.0[${PYTHON_USEDEP}]
	>=dev-python/langgraph-checkpoint-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/langgraph-prebuilt-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/langgraph-sdk-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.0.0[${PYTHON_USEDEP}]
	dev-python/xxhash[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	epytest -q
}
