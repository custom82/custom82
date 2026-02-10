# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="LangChain text splitting utilities (from langchain monorepo: libs/text-splitters)"
HOMEPAGE="https://github.com/langchain-ai/langchain/tree/master/libs/text-splitters"

MY_PN="langchain"
MY_TAG="langchain==${PV}"
MY_P="${MY_PN}-${MY_TAG}"

SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/${MY_TAG}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

# Costruiamo solo la subtree del monorepo
S="${WORKDIR}/langchain-langchain-${PV}/libs/text-splitters"

RDEPEND="
	>=dev-python/langchain-core-0.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	dev-python/poetry-core[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
