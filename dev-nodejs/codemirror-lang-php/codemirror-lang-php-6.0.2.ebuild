# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements PHP language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/lang-php"
SRC_URI="https://github.com/codemirror/lang-php/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-lang-html
        dev-nodejs/codemirror-language
        dev-nodejs/codemirror-state
        dev-nodejs/lezer-common
        dev-nodejs/lezer-php
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"

NPM_MODULE="@codemirror/lang-php"

NPM_EXTRA_FILES="src"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/lang-php-${PV} "${S}"
}

