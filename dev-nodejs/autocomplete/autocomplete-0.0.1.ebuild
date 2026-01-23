# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Node Autocomplete is an autocomplete library for node.js"
HOMEPAGE="https://www.npmjs.com/package/autocomple"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="dev-nodejs/buildhelper"

NPM_EXTRA_FILE="lib"

npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}/package" ${S}
}


