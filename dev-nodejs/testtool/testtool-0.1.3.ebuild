# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Utility for running collections of Mocha test files that contain both Node-based and browser-based tests"
HOMEPAGE="https://github.com/marijnh/testtool"
SRC_URI="https://github.com/marijnh/testtool/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/esmoduleserve
        dev-nodejs/ist
        dev-nodejs/mocha
        dev-nodejs/selenium-webdriver
        dev-nodejs/serve-static
"

NPM_EXTRA_FILES="src bin"

npm_src_unpack() {
    unpack "${A}"
}

