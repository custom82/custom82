EAPI=8

DESCRIPTION="Chromium depot_tools (gclient, gn, autoninja, etc.) - pinned snapshot"
HOMEPAGE="https://chromium.googlesource.com/chromium/tools/depot_tools"

COMMIT="9fd48a305e18b9bbaf61734557ce2c46497192b3"
SRC_URI="https://chromium.googlesource.com/chromium/tools/depot_tools.git/+archive/${COMMIT}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-lang/python
	dev-vcs/git
	net-misc/curl
"

# Gitiles +archive estrae direttamente in WORKDIR senza dir top-level
S="${WORKDIR}"

src_prepare() {
	default
}

src_compile() {
	:
}

src_install() {
	local install_root="/opt/depot_tools/${PV}"

	dodir "${install_root}"
	cp -a . "${ED}${install_root}/" || die "cp -a failed"

	# depot_tools usa questo per trovare il python3 di sistema dal wrapper python-bin/python3
	# Da /opt/depot_tools/current/python-bin -> /usr/bin = ../../../../usr/bin
	insinto "${install_root}"
	newins "${FILESDIR}/python3_bin_reldir.txt" python3_bin_reldir.txt

	# Symlink "current"
	dosym "${install_root}" "/opt/depot_tools/current"

	# PATH via env.d
	doenvd "${FILESDIR}/50depot_tools"

	# Docs (se presenti)
	[[ -f README.md ]] && dodoc README.md
	[[ -f LICENSE ]] && dodoc LICENSE
}
