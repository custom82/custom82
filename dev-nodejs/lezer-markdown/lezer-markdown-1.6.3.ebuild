# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements HTML language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/lezer-parser/markdown"
SRC_URI="https://github.com/lezer-parser/markdown/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/lezer-common
        dev-nodejs/lezer-highlight
"

BDEPEND="
        dev-nodejs/lezer-html
        dev-nodejs/marijn-buildtool
        dev-nodejs/getdocs-ts
        dev-nodejs/ist
        dev-nodejs/mocha
"

NPM_MODULE="@lezer/markdown"

NPM_EXTRA_FILES="src bin tsconfig.json"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/markdown-${PV} "${S}"
}
