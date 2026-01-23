# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="Lezer is an incremental parser system intended for use in an editor or similar system"
HOMEPAGE="https://github.com/lezer-parser/common"
SRC_URI="https://github.com/lezer-parser/common/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/marijn-buildtool
        dev-nodejs/types-mocha
        dev-nodejs/ist
        dev-nodejs/mocha
        dev-nodejs/ts-node
"

NPM_MODULE="@lezer/common"

NPM_EXTRA_FILES="build.js src tsconfig.json"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/common-${PV} ${S}
}

