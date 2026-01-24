# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This is a C++ grammar for the Lezer parser system."
HOMEPAGE="https://github.com/codemirror/lang-css"
SRC_URI="https://github.com/codemirror/lang-css/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-autocomplete
        dev-nodejs/codemirror-language
        dev-nodejs/codemirror-state
        dev-nodejs/lezer-common
        dev-nodejs/lezer-css
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"


NPM_MODULE="@codemirror/lang-css"

NPM_EXTRA_FILES="src"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/lang-css-${PV} "${S}"
}
