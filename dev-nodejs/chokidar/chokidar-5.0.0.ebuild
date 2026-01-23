# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This is a tool for extracting documentation and typing information from TypeScript sources"
HOMEPAGE="https://github.com/paulmillr/chokidar"
SRC_URI="https://github.com/paulmillr/chokidar/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="tsconfig.json src"


RDEPEND="
        dev-nodejs/readdirp
"

BDEPEND="
        dev-nodejs/jsbt
        dev-nodejs/node
        dev-nodejs/prettier
        dev-nodejs/tinyspy
        dev-nodejs/typescript
        dev-nodejs/upath
"
