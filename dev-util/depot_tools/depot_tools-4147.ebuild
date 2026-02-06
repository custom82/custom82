EAPI=8

DESCRIPTION="Chromium depot_tools (gclient, gn, autoninja, etc.)"
HOMEPAGE="https://chromium.googlesource.com/chromium/tools/depot_tools"
SRC_URI="https://chromium.googlesource.com/chromium/tools/depot_tools/+archive/refs/heads/chrome/4147.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

RDEPEND="
	dev-lang/python
	dev-vcs/git
	net-misc/curl
"

S="${WORKDIR}"

src_compile() {
	:
}

src_install() {
	local install_root="/opt/depot_tools/${PV}"

	dodir "${install_root}"
	cp -a . "${ED}${install_root}/" || die

	dosym "${install_root}" "/opt/depot_tools/current"

	# env.d file dal FILESDIR
	doenvd "${FILESDIR}/50depot_tools"

	[[ -f README.md ]] && dodoc README.md
	[[ -f LICENSE ]] && dodoc LICENSE
}

pkg_postinst() {
	elog "Aggiorna l'ambiente con:"
	elog "  env-update && source /etc/profile"
}
