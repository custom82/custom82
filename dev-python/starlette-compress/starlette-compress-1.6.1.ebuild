# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="starlette-compress is a fast and simple middleware for compressing responses"
HOMEPAGE="https://github.com/Zaczero/starlette-compress"
SRC_URI="https://github.com/Zaczero/starlette-compress/archive/refs/tags/1.6.1.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND=""
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-cov[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	epytest tests/ || die "Tests failed with ${EPYTHON}"
}
