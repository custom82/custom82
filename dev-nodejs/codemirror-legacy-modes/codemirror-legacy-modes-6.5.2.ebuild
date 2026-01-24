# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements a collection of ported stream language modes for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/legacy-modes"
SRC_URI="https://github.com/codemirror/legacy-modes/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-autocomplete
        dev-nodejs/codemirror-language
"

BDEPEND="
        dev-nodejs/rollup
        dev-nodejs/typescript
"

NPM_MODULE="@codemirror/legacy-modes"

NPM_EXTRA_FILES="rollup.config.js mode"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/legacy-modes-${PV} "${S}"
}

