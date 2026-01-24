# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements HTML language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/lezer-parser/html"
SRC_URI="https://github.com/lezer-parser/html/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/lezer-common
        dev-nodejs/lezer-highlight
        dev-nodejs/lezer-lr
"

BDEPEND="
        dev-nodejs/lezer-generator
        dev-nodejs/lezer-javascript
        dev-nodejs/rollup-plugin-node-resolve
        dev-nodejs/mocha
        dev-nodejs/rollup
"

NPM_MODULE="@lezer/html"

NPM_EXTRA_FILES="rollup.config.js src dist"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/html-${PV} "${S}"
}
