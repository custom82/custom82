# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="Lezer is an incremental parser system intended for use in an editor or similar system"
HOMEPAGE="https://github.com/lezer-parser/highlight"
SRC_URI="https://github.com/lezer-parser/highlight/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/lezer-common
"

BDEPEND="
        dev-nodejs/marijn-buildtool
        dev-nodejs/typescript
"

NPM_MODULE="@lezer/highlight"

NPM_EXTRA_FILES="tsconfig.json src build.js"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/highlight-${PV} ${S}
}

