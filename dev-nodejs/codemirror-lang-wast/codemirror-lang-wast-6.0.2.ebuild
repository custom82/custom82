# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements WebAssembly Text Format language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/lang-wast"
SRC_URI="https://github.com/codemirror/lang-wast/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-language
        dev-nodejs/lezer-common
        dev-nodejs/lezer-highlight
        dev-nodejs/lezer-lr
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"

NPM_MODULE="@codemirror/lang-vue"

NPM_EXTRA_FILES="src"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/lang-wast-${PV} "${S}"
}

