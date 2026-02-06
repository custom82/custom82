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

S="${WORKDIR}"

src_compile() { :; }

src_install() {
	local install_root="/opt/depot_tools/${PV}"

	dodir "${install_root}"
	cp -a . "${ED}${install_root}/" || die "cp -a failed"

	# Gentoo: usa il python di sistema, evita bootstrap/vpython/python-bin ricorsivi
	if [[ -e "${ED}${install_root}/python-bin/python3" ]] ; then
		cat > "${ED}${install_root}/python-bin/python3" <<'EOF' || die
#!/bin/sh
exec /usr/bin/python3 "$@"
EOF
		chmod +x "${ED}${install_root}/python-bin/python3" || die
	fi

	# Non vogliamo il meccanismo reldir: può causare loop
	rm -f "${ED}${install_root}/python3_bin_reldir.txt" || die

	dosym "${install_root}" "/opt/depot_tools/current"

	doenvd "${FILESDIR}/50depot_tools"

	[[ -f README.md ]] && dodoc README.md
	[[ -f LICENSE ]] && dodoc LICENSE
}

pkg_postinst() {
	elog "Esegui: env-update && source /etc/profile"
	elog "Test: gn --help ; gclient --version"
}
