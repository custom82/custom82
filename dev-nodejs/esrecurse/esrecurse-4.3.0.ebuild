# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="esrecurse"
inherit npm

DESCRIPTION="Esrecurse (esrecurse) is ECMAScript recursive traversing functionality"
HOMEPAGE="https://github.com/estools/esrecurse"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/estraverse
"
