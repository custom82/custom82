# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Tiny DOM-element creation utility"
HOMEPAGE="https://github.com/marijnh/crelt"
SRC_URI="https://github.com/marijnh/crelt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/rolluprollup-plugin-copy
        dev-nodejs/rolluprollup
"

NPM_EXTRA_FILES="rollup.config.js index.d.ts"

npm_src_unpack() {
    unpack "${A}"
}
