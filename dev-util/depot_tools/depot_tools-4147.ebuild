EAPI=8

DESCRIPTION="Chromium depot_tools (gclient, fetch, git-cl, etc.) - pinned"
HOMEPAGE="https://chromium.googlesource.com/chromium/tools/depot_tools"
# Gitiles archive del branch chrome/4147 (commit af45aa86aced54e87d3a5f061b504fd486694a27)
SRC_URI="https://chromium.googlesource.com/chromium/tools/depot_tools/+archive/refs/heads/chrome/4147.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
	dev-lang/python
	dev-vcs/git
	net-misc/curl
"
BDEPEND="app-arch/tar"

# IMPORTANT: il +archive di Gitiles estrae i file direttamente in ${WORKDIR} (senza directory top-level)
S="${WORKDIR}"

src_unpack() {
	default
}

src_compile() {
	:
}

src_install() {
	local install_root="/opt/depot_tools/${PV}"

	dodir "${install_root}"
	# Copia preservando permessi (+x sugli script)
	cp -a . "${ED}${install_root}/" || die "cp -a failed"

	# Symlink "current" per comodità
	dosym "${install_root}" "/opt/depot_tools/current"

	# Entry points (ninja -> ninja-depot per non confliggere con dev-util/ninja)
	dosym "/opt/depot_tools/current/gclient"   "/usr/bin/gclient"
	dosym "/opt/depot_tools/current/fetch"     "/usr/bin/fetch"
	dosym "/opt/depot_tools/current/gcl"       "/usr/bin/gcl"
	dosym "/opt/depot_tools/current/git-cl"    "/usr/bin/git-cl"
	dosym "/opt/depot_tools/current/git-try"   "/usr/bin/git-try"
	dosym "/opt/depot_tools/current/gn"        "/usr/bin/gn"
	dosym "/opt/depot_tools/current/autoninja" "/usr/bin/autoninja"
	dosym "/opt/depot_tools/current/ninja"     "/usr/bin/ninja-depot"

	# Doc se presente nell'archive
	[[ -f README.md ]] && dodoc README.md
	[[ -f LICENSE ]] && dodoc LICENSE
}

pkg_postinst() {
	einfo "depot_tools installato in /opt/depot_tools/${PV} (symlink: /opt/depot_tools/current)."
	einfo "Wrapper installati in /usr/bin (gclient, fetch, gn, autoninja, ...)."
	einfo "Se vuoi tutto via PATH: export PATH=/opt/depot_tools/current:\$PATH"
}
