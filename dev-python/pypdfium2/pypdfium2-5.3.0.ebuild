EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="ABI-level Python bindings to PDFium (ctypes-based)"
HOMEPAGE="https://github.com/pypdfium2-team/pypdfium2"
SRC_URI="https://github.com/pypdfium2-team/pypdfium2/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/pypdfium2-${PV}"

LICENSE="BSD-3-Clause Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="app-text/pdfium"

RESTRICT="test"

python_compile() {
	export PDFIUM_PLATFORM="system-search"
	distutils-r1_python_compile
}

python_install() {
	export PDFIUM_PLATFORM="system-search"
	distutils-r1_python_install
}
