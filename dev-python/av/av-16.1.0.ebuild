EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Pythonic bindings for FFmpeg libraries"
HOMEPAGE="https://github.com/PyAV-Org/PyAV"
SRC_URI="https://github.com/PyAV-Org/PyAV/archive/refs/tags/v${PV}.tar.gz -> PyAV-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/PyAV-${PV}"

RDEPEND="
	media-video/ffmpeg:0=
"
DEPEND="
	${RDEPEND}
	dev-python/cython[${PYTHON_USEDEP}]
	virtual/pkgconfig
"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest

python_prepare_all() {
	distutils-r1_python_prepare_all
}
