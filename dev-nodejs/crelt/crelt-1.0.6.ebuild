# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="Tiny DOM-element creation utility. Exports a single (default) value"
HOMEPAGE="https://github.com/marijnh/crelt"
SRC_URI="https://github.com/marijnh/crelt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/rollup
        dev-nodejs/rollup-plugin-copy
"

NPM_MODULE="crelt"

NPM_EXTRA_FILES="rollup.config.js index.js index.d.ts"


npm_src_unpack() {
    unpack "${A}"
}
