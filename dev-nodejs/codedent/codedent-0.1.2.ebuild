# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="codedent"
inherit npm

DESCRIPTION="Usable both as template literal tag or just as callback for strings"
HOMEPAGE="https://www.npmjs.com/package/codedent"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/plain-tag
"

