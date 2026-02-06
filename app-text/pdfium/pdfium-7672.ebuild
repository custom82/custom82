EAPI=8

DESCRIPTION="PDFium PDF rendering library (Chromium branch 7672)"
HOMEPAGE="https://pdfium.googlesource.com/pdfium/"
SRC_URI="https://pdfium.googlesource.com/pdfium/+archive/refs/heads/chromium/7672.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE="v8 xfa"
REQUIRED_USE="xfa? ( v8 )"

DEPEND="
	dev-build/gn
	dev-build/ninja
"
RDEPEND="${DEPEND}"

S="${WORKDIR}"

src_configure() {
	local args=(
		is_debug=false
		is_component_build=false
		treat_warnings_as_errors=false

		use_sysroot=false
		use_custom_libcxx=false
		clang_use_chrome_plugins=false

		pdf_is_standalone=true
		pdf_is_complete_lib=true

		pdf_enable_v8=$(usex v8 true false)
		pdf_enable_xfa=$(usex xfa true false)
	)

	gn gen out/Release --args="${args[*]}" || die
}

src_compile() {
	ninja -C out/Release pdfium || die
}

src_install() {
	dolib.so out/Release/libpdfium.so || die

	insinto /usr/include/pdfium
	doins -r public/* || die
}
