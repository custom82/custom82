# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="which"
inherit npm

DESCRIPTION="Like the unix which utility"
HOMEPAGE="https://github.com/npm/node-which"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/isexe
"
