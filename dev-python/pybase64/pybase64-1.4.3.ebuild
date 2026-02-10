EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1

inherit distutils-r1

DESCRIPTION="Fast Base64 implementation for Python"
HOMEPAGE="https://github.com/mayeut/pybase64"
SRC_URI="https://github.com/mayeut/pybase64/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND=""
DEPEND="${RDEPEND}"

S="${WORKDIR}/pybase64-${PV}"

distutils_enable_tests pytest
