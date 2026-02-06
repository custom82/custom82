EAPI=8

inherit git-r3

DESCRIPTION="gclient from Chromium depot_tools (without bundled gn)"
HOMEPAGE="https://chromium.googlesource.com/chromium/tools/depot_tools"
EGIT_REPO_URI="https://chromium.googlesource.com/chromium/tools/depot_tools.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
    dev-vcs/git
    dev-lang/python
"

src_install() {
    local toolsdir="/usr/lib64/depot_tools"

    insinto "${toolsdir}"
    doins -r *

    # remove bundled gn to avoid conflict with dev-build/gn
    rm -f "${ED}${toolsdir}/gn" || true
    rm -rf "${ED}${toolsdir}/bootstrap-gn" || true

    # install gclient wrapper
    dosym ../lib/depot_tools/gclient /usr/bin/gclient
}
