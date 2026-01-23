# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This package implements the DOM view component for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/view"
SRC_URI="https://github.com/codemirror/view/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-nodejs/state
         dev-nodejs/crelt
         dev-nodejs/style-mod
         dev-nodejs/w3c-keyname
"

BDEPEND="dev-nodejs/buildhelper"

NPM_EXTRA_FILES="src"

npm_src_unpack() {
    unpack "${A}"
}
