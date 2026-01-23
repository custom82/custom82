# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Utility to build TypeScript projects that conform to a given set of conventions quickly and cleanly"
HOMEPAGE="https://github.com/marijnh/buildtool"
SRC_URI="https://github.com/marijnh/buildtool/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/mocha
        dev-nodejs/acorn
        dev-nodejs/acorn-walk
        dev-nodejs/rollup
        dev-nodejs/rollup-plugin-dts
        dev-nodejs/typescript
"

BDEPEND="
        dev-nodejs/node
        dev-nodejs/builddocs
        dev-nodejs/getdocs-ts
"

NPM_EXTRA_FILES="tsconfig.json"

npm_src_unpack() {
    unpack "${A}"
}

