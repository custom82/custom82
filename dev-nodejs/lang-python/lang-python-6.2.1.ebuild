# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Small JavaScript module for finding grapheme cluster breaks in strings, scanning from a given position"
HOMEPAGE="https://github.com/codemirror/lang-python"
SRC_URI="https://github.com/codemirror/lang-python/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

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


NPM_EXTRA_FILES="src dist"

npm_src_unpack() {
    unpack "${A}"
}
