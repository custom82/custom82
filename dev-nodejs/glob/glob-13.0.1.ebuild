# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="glob"
inherit npm

DESCRIPTION="Match files using the patterns the shell uses"
HOMEPAGE="https://github.com/isaacs/node-glob"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
         dev-nodejs/minimatch
         dev-nodejs/minipass
         dev-nodejs/path-scurry
"
