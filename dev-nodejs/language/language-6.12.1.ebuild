# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This package implements the language support infrastructure for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/language"
SRC_URI="https://github.com/codemirror/language/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDENPEND="
    dev-nodejs/state
    dev-nodejs/view
    dev-nodejs/common
    dev-nodejs/highlist
    dev-nodejs/lr
    dev-nodejs/style-moda
"

BDEPEND="dev-nodejs/buildhelper
         dev-nodejs/javascript"

NPM_EXTRA_FILES="src"

npm_src_unpack() {
    unpack "${A}"
}


