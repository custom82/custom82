# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="y-protocols"
inherit npm

DESCRIPTION="The Awareness protocol implements a simple network agnostic algorithm that manages user status"
HOMEPAGE="https://github.com/yjs/y-protocols"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/lib0
"
