# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="w3c-keyname"
inherit npm

DESCRIPTION="Tiny library that exports a function keyName that takes a keyboard event and returns a KeyboardEvent.key-style string"
HOMEPAGE="https://github.com/marijnh/w3c-keyname"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/rollup

"

NPM_EXTRA_FILES="index.d.ts index.js index.d.cts index.d.cts index.cjs"
