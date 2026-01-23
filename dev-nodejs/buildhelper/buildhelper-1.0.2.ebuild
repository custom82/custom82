# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Helper scripts to build and test CodeMirror packages."
HOMEPAGE="https://github.com/codemirror/buildhelper"
SRC_URI="https://github.com/codemirror/buildhelper/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/generator
        dev-nodejs/buildtool
        dev-nodejs/testtool
"

BDEPEND="
        dev-nodejs/node
"

NPM_EXTRA_FILES="bin"

npm_src_unpack() {
    unpack "${A}"
}

