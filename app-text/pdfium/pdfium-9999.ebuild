EAPI=8

inherit toolchain-funcs

DESCRIPTION="PDFium PDF rendering library (Chromium project)"
HOMEPAGE="https://pdfium.googlesource.com/pdfium/"
LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="v8 xfa"
REQUIRED_USE="xfa? ( v8 )"

BDEPEND="
	dev-build/gn
	dev-build/ninja
	dev-vcs/git
	dev-lang/python
"

DEPEND=""
RDEPEND=""

S="${WORKDIR}/repo/pdfium"

src_unpack() {
	mkdir -p "${WORKDIR}/repo" || die
	cd "${WORKDIR}/repo" || die

	# evita auto-update di depot_tools e scritture nel $HOME reale
	export DEPOT_TOOLS_UPDATE=0
	export HOME="${T}"

	gclient config --unmanaged https://pdfium.googlesource.com/pdfium.git || die
	gclient sync --no-history || die
}

src_configure() {
	cd "${S}" || die

	local args=(
		is_component_build=false
		is_debug=false
		treat_warnings_as_errors=false
		use_sysroot=false

		pdf_enable_v8=$(usex v8 true false)
		pdf_enable_xfa=$(usex xfa true false)
	)

	gn gen out/Release --args="${args[*]}" || die
}

src_compile() {
	cd "${S}" || die
	ninja -C out/Release pdfium || die
}

src_install() {
	cd "${S}" || die

	local so=""
	if [[ -f out/Release/libpdfium.so ]] ; then
		so="out/Release/libpdfium.so"
	else
		# fallback: cerca una .so prodotta (max 3 livelli, per evitare traverse enormi)
		so="$(find out/Release -maxdepth 3 -type f \( -name 'libpdfium.so' -o -name '*pdfium*.so' \) | head -n1)"
	fi

	[[ -n "${so}" && -f "${so}" ]] || die "Nessuna libreria .so trovata in out/Release (build non riuscito o target diverso)"

	dolib.so "${so}" || die

	insinto /usr/include/pdfium
	doins -r public/* || die
}
