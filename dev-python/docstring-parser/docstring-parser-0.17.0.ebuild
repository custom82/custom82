# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Parse Python docstrings in reST, Google and Numpydoc format"
HOMEPAGE="https://github.com/rr-/docstring_parser https://pypi.org/project/docstring-parser/"
SRC_URI="https://github.com/rr-/docstring_parser/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="!test? ( test )"

BDEPEND="
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"

S="${WORKDIR}/docstring_parser-${PV}"

distutils_enable_tests pytest
