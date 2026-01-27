# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="chokidar"
inherit npm

DESCRIPTION="Minimal and efficient cross-platform file watching library"
HOMEPAGE="https://github.com/paulmillr/chokidar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/readdirp
"
