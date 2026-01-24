# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This is a YAML grammar for the lezer parser system"
HOMEPAGE="https://github.com/lezer-parser/yaml"
SRC_URI="https://github.com/lezer-parser/yaml/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

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
        dev-nodejs/lazer-generator
        dev-nodejs/rollup-plugin-node-resolv
        dev-nodejs/mocha
        dev-nodejs/rollup
"

NPM_MODULE="@lezer/yaml"

NPM_EXTRA_FILES="rollup.config.js src dist"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/yaml-${PV} "${S}"
}
