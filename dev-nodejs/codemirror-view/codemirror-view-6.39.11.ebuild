# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements the editor state data structures for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/view"
SRC_URI="https://github.com/codemirror/view/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-state
        dev-nodejs/crelt
        dev-nodejs/style-mod
        dev-nodejs/w3c-keyname
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"

NPM_MODULE="@codemirror/view"

NPM_EXTRA_FILES="src"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/view-${PV} "${S}"
}

