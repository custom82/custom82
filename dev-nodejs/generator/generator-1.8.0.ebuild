# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This is an LR(1) (more precisely pseudo-LALR,with opt-in GLR) parser generator which outputs grammars that can be used by the Lezer parser"
HOMEPAGE="https://github.com/lezer-parser/generator"
SRC_URI="https://github.com/lezer-parser/generator/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/common
        dev-nodejs/lr
"

BDEPEND="
        dev-nodejs/buildtool
        dev-nodejs/mocha
        dev-nodejs/node
        dev-nodejs/ist
        dev-nodejs/ts-node"

NPM_EXTRA_FILES="dist src build.js"

npm_src_unpack() {
    unpack "${A}"
}

