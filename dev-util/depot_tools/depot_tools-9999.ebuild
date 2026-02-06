EAPI=8

inherit git-r3

DESCRIPTION="Chromium depot_tools (gclient, gn, ninja wrappers, etc.)"
HOMEPAGE="https://chromium.googlesource.com/chromium/tools/depot_tools"
EGIT_REPO_URI="https://chromium.googlesource.com/chromium/tools/depot_tools.git"

LICENSE="BSD"
SLOT="0"
KEYWORDS=""
IUSE=""

RDEPEND="
    dev-vcs/git
    dev-lang/python
    dev-build/ninja
"

src_unpack() {
    git-r3_src_unpack
}

src_prepare() {
    default
}

src_compile() {
    :
}

src_install() {
    insinto /opt/depot_tools
    doins -r *

    dosym /opt/depot_tools/gclient /usr/bin/gclient
    dosym /opt/depot_tools/gn /usr/bin/gn
    dosym /opt/depot_tools/ninja /usr/bin/ninja-depot
}
