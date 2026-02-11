# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

MY_TAG="1.0.8"

DESCRIPTION="Library with base interfaces for LangGraph checkpoint savers."
HOMEPAGE="
	https://github.com/langchain-ai/langgraph/tree/main/libs/checkpoint
	https://pypi.org/project/langgraph-checkpoint/
"
SRC_URI="https://github.com/langchain-ai/langgraph/archive/refs/tags/${MY_TAG}.tar.gz -> ${P}-langgraph-${MY_TAG}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

DISTUTILS_USE_PEP517=hatchling

S="${WORKDIR}/langgraph-${MY_TAG}/libs/checkpoint"

RESTRICT="test"

RDEPEND="
	>=dev-python/langchain-core-0.2.38[${PYTHON_USEDEP}]
	>=dev-python/ormsgpack-1.12.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_prepare_all() {
	# Restringi il wheel: includi solo checkpoint + interfacce base
	sed -i -E \
		-e '/^\[tool\.hatch\.build\.targets\.wheel\]$/,/^\[/{s|^include = \[.*\]$|include = ["langgraph/checkpoint", "langgraph/store/base", "langgraph/cache/base"]|;}' \
		pyproject.toml || die

	distutils-r1_python_prepare_all
}
