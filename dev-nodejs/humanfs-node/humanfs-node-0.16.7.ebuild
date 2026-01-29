# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@humanfs/node"
inherit npm

DESCRIPTION="A modern filesystem API for JavaScript"
HOMEPAGE="https://github.com/humanwhocodes/humanfs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/humanfs-core
        dev-nodejs/humanwhocodes-retry
"
