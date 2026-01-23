# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements autocompletion for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/autocomplete"
SRC_URI="https://github.com/codemirror/autocomplete/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-language
        dev-nodejs/codemirror-state
        dec-nodejs/codemirror-view
        dev-nodejs/lezer-common
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"

NPM_MODULE="@codemirror/autocomplete"

NPM_EXTRA_FILES="src"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/autocomplete-${PV} "${S}"
}

