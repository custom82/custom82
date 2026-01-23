# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This is a JavaScript grammar for the lezer parser system"
HOMEPAGE="https://github.com/lezer-parser/javascript"
SRC_URI="https://github.com/lezer-parser/javascript/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-nodejs/common
         dev-nodejs/highlight
         dev-nodejs/lr
"

BDEPEND="dev-nodejs/buildhelper
         dev-nodejs/lr
"

NPM_EXTRA_FILES="src dist rollup.config.js"

npm_src_unpack() {
    unpack "${A}"
}
