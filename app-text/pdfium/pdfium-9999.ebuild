EAPI=8

inherit git-r3 toolchain-funcs

DESCRIPTION="PDFium PDF rendering library (Chromium project)"
HOMEPAGE="https://pdfium.googlesource.com/pdfium/"
EGIT_REPO_URI="https://pdfium.googlesource.com/pdfium"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="v8 xfa"

DEPEND="
    dev-build/gn
    dev-build/ninja
    llvm-core/clang
    llvm-core/llvm
"
RDEPEND="${DEPEND}"

src_configure() {
    local args=(
        is_component_build=false
        pdf_is_standalone=true
        pdf_enable_v8=$(usex v8 true false)
        pdf_enable_xfa=$(usex xfa true false)
        use_sysroot=false
        treat_warnings_as_errors=false
        is_debug=false
    )

    gn gen out/Release --args="${args[*]}"
}

src_compile() {
    ninja -C out/Release pdfium
}

src_install() {
    dolib.so out/Release/libpdfium.so

    insinto /usr/include/pdfium
    doins -r public/*
}
