# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="crelt"
inherit npm

DESCRIPTION="Tiny DOM-element creation utility. Exports a single (default) value"
HOMEPAGE="https://github.com/marijnh/crelt"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/rollup
        dev-nodejs/rollup-plugin-copy
"

NPM_EXTRA_FILES="rollup.config.js index.d.ts index.js dist"
