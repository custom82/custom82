# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cross-spawn"
inherit npm

DESCRIPTION="A cross platform solution to node's spawn and spawnSync"
HOMEPAGE="A cross platform solution to node's spawn and spawnSync"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/path-key
        dev-nodejs/shebang-command
        dev-nodejs/which
"
