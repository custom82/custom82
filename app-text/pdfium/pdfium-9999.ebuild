EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit git-r3 python-any-r1 toolchain-funcs

DESCRIPTION="PDFium PDF rendering library (Chromium project)"
HOMEPAGE="https://pdfium.googlesource.com/pdfium/"
EGIT_REPO_URI="https://pdfium.googlesource.com/pdfium.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE="v8 xfa"
REQUIRED_USE="xfa? ( v8 )"

BDEPEND="
	${PYTHON_DEPS}
	dev-vcs/git
	dev-build/gn
	dev-util/ninja
"

# checkout dentro root "gclient" così i DEPS finiscono nel posto giusto
EGIT_CHECKOUT_DIR="${WORKDIR}/gclient_root/pdfium"
S="${WORKDIR}/gclient_root/pdfium"

src_prepare() {
	default

	# depot_tools locale (solo per questa build)
	local dt="${WORKDIR}/depot_tools"
	if [[ ! -d ${dt}/.git ]] ; then
		einfo "Cloning depot_tools locally into ${dt}"
		git clone --depth 1 https://chromium.googlesource.com/chromium/tools/depot_tools.git "${dt}" || die
	fi

	# gclient root e .gclient
	local root="${WORKDIR}/gclient_root"
	mkdir -p "${root}" || die

	cat > "${root}/.gclient" <<-'EOF' || die
solutions = [
  {
    "name": "pdfium",
    "url": "https://pdfium.googlesource.com/pdfium.git",
    "managed": False,
    "custom_deps": {},
    "custom_vars": {},
  },
]
EOF

	export DEPOT_TOOLS_UPDATE=0
	export HOME="${T}"
	export PATH="${dt}:${PATH}"

	cd "${root}" || die
	einfo "Running gclient sync (fetches PDFium DEPS)..."
	gclient sync --no-history || die

	[[ -f "${S}/build/config/BUILDCONFIG.gn" ]] || die "DEPS non scaricate: manca build/config/BUILDCONFIG.gn dopo gclient sync"
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
		so="$(find out/Release -maxdepth 3 -type f \( -name 'libpdfium.so' -o -name '*pdfium*.so' \) | head -n1)"
	fi

	[[ -n "${so}" && -f "${so}" ]] || die "Nessuna libreria .so trovata in out/Release"
	dolib.so "${so}" || die

	insinto /usr/include/pdfium
	doins -r public/* || die
}
