# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="Lezer ("reader" in Dutch, pronounced pretty much as laser) is an incremental GLR parser intended for use in an editor or similar system"
HOMEPAGE="https://github.com/lezer-parser/lr"
SRC_URI="https://github.com/lezer-parser/lr/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/lezer-common
"

BDEPEND="
        dev-nodejs/marijn-buildtool
        dev-nodejs/types-node
"

NPM_MODULE="@lezer/lr"

NPM_EXTRA_FILES="tsconfig.json src build.js"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/lr-${PV} ${S}
}
