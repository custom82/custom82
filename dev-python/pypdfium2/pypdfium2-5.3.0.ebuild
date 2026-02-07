EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python bindings to PDFium (ctypes-based) with optional system PDFium"
HOMEPAGE="https://github.com/pypdfium2-team/pypdfium2"
SRC_URI="https://github.com/pypdfium2-team/pypdfium2/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/pypdfium2-${PV}"

LICENSE="BSD-3-Clause Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# tests upstream spesso dipendono da asset / rete, meglio tenerli off in overlay
RESTRICT="test"

BDEPEND="
	virtual/pkgconfig
"

# usa il tuo pdfium di sistema
RDEPEND="
	dev-libs/libpdfium
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/pypdfium2-5.3.0-fix-run_cmd-capture.patch"
)

python_compile() {
	# IMPORTANT: evita fetch rete (git ls-remote su chromium.googlesource.com)
	export IGNORE_FULLVER=1

	# forza uso pdfium di sistema e passa il build number (7049 nel tuo caso)
	local pdfver
	pdfver="$(pkg-config --modversion libpdfium)" || die "pkg-config libpdfium fallito"
	export PDFIUM_PLATFORM="system-search:${pdfver}"

	distutils-r1_python_compile
}

python_install() {
	export IGNORE_FULLVER=1

	local pdfver
	pdfver="$(pkg-config --modversion libpdfium)" || die "pkg-config libpdfium fallito"
	export PDFIUM_PLATFORM="system-search:${pdfver}"

	distutils-r1_python_install
}
