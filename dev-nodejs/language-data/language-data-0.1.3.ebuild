# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Linguistic data especially useful for font designers"
HOMEPAGE="https://www.npmjs.com/package/language-data"
SRC_URI="https://github.com/hyvyys/language-data/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/autocomplete
        dev-nodejs/language
        dev-nodejs/state
        dev-nodejs/common
        dev-nodejs/python
"

BDEPEND="
        dev-nodejs/buildhelper
"


NPM_EXTRA_FILES="src scripts dist"

npm_src_unpack() {
    unpack "${A}"
}
