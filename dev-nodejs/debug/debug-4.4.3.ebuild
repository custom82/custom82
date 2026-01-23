# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This is a tool for extracting documentation and typing information from TypeScript sources"
HOMEPAGE="https://github.com/debug-js/debug"
SRC_URI="https://github.com/debug-js/debug/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="src karma.conf.js"

RDEPEND="
        dev-nodejs/ms
"

BDEPEND="
        dev-nodejs/brfs
        dev-nodejs/browserify
        dev-nodejs/coveralls
        dev-nodejs/karma
        dev-nodejs/karma-browserify
        dev-nodejs/karma-chrome-launcher
        dev-nodejs/karma-mocha
        dev-nodejs/mocha
        dev-nodejs/mocha-lcov-reporter
        dev-nodejs/sinon
        dev-nodejs/xo
"

npm_src_unpack() {
    unpack "${A}"
}
