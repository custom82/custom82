# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="parent-module"
inherit npm

DESCRIPTION="Get the path of the parent module"
HOMEPAGE="https://github.com/sindresorhus/parent-module"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/callsites
"

