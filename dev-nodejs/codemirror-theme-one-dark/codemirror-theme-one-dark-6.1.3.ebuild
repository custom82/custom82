# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements the One Dark theme for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/theme-one-dark"
SRC_URI="https://github.com/codemirror/theme-one-dark/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-language
"

BDEPEND="
        dev-nodejs/rollup
        dev-nodejs/typescript
"

NPM_MODULE="@codemirror/theme-one-dark"

NPM_EXTRA_FILES="src"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/theme-one-dark-${PV} "${S}"
}

