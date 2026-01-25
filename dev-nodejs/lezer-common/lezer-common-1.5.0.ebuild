# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@lezer/common"
inherit npm

DESCRIPTION="Lezer is an incremental parser system intended for use in an editor or similar system"
HOMEPAGE="https://github.com/lezer-parser/common"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/marijn-buildtool
        dev-nodejs/types-mocha
        dev-nodejs/ist
        dev-nodejs/mocha
        dev-nodejs/ts-node
"
