# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This package implements JavaScript language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/lang-javascript"
SRC_URI="https://github.com/codemirror/${PN}/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
    dev-nodejs/autocomplete
    dev-nodejs/language
    dev-nodejs/lint
    dev-nodejs/state
    dev-nodejs/view
    dev-nodejs/common
    dev-nodejs/javascript
"
BDEPEND="dev-nodejs/buildhelper
         dev-nodejs/lr
"
NPM_EXTRA_FILES="src"

npm_src_unpack() {
    unpack "${A}"
}
