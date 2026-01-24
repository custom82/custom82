# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This is a Go grammar for the Lezer parser system"
HOMEPAGE="https://github.com/lezer-parser/go"
SRC_URI="https://github.com/lezer-parser/go/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/lezer-common
        dev-nodejs/lezer-highligth
        dev-nodejs/leezr-lr
"

BDEPEND="
        dev-nodejs/lezer-generator
        dev-nodejs/rollup-plugin-node-resolve
        dev-nodejs/mocha
        dev-nodejs/rollup
"

NPM_MODULE="@lezer/go"

NPM_EXTRA_FILES="src rollup.config.js"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/go-${PV} "${S}"
}
