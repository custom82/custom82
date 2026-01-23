# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This is a tool for extracting documentation and typing information from TypeScript sources"
HOMEPAGE="https://www.npmjs.com/package/getdocs-ts"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="tsconfig.json src bin"

RDEPEND="
        dev-nodejs/typescript
"

BDEPEND="
        dev-nodejs/node
        dev-nodejs/mocha"
