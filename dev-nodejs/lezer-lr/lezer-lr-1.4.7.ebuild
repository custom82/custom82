# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@lezer/lr"
inherit npm

DESCRIPTION="Lezer ("reader" in Dutch, pronounced pretty much as laser) is an incremental GLR parser intended for use in an editor or similar system"
HOMEPAGE="https://github.com/lezer-parser/lr"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/lezer-common
"

BDEPEND="
        dev-nodejs/marijn-buildtool
        dev-nodejs/types-node
"
