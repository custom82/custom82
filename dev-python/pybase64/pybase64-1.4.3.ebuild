EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1

inherit distutils-r1

DESCRIPTION="Fast Base64 implementation for Python"
HOMEPAGE="https://github.com/mayeut/pybase64"

BASE64_PV="0.5.2"

SRC_URI="
	https://github.com/mayeut/pybase64/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/aklomp/base64/archive/refs/tags/v${BASE64_PV}.tar.gz -> ${P}-base64-${BASE64_PV}.tar.gz
"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/pybase64-${PV}"

BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

src_unpack() {
	default

	# GitHub tag archive extracts to base64-${BASE64_PV}
	local base64_dir="base64-${BASE64_PV}"

	unpack "${P}-base64-${BASE64_PV}.tar.gz" || die

	rm -rf "${S}/base64" || die
	mv "${WORKDIR}/${base64_dir}" "${S}/base64" || die
}
