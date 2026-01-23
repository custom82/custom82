# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="TTiny library that exports a function keyName that takes a keyboard event and returns a KeyboardEvent.key-style string"
HOMEPAGE="https://github.com/marijnh/w3c-keyname"
SRC_URI="https://github.com/marijnh/w3c-keyname/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="dev-nodejs/rollup"

NPM_EXTRA_FILES="rollup.config.js index.js index.d.ts index.d.cts"

npm_src_unpack() {
    unpack "${A}"
}
