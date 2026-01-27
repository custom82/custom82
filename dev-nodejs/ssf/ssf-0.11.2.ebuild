# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="ssf"
inherit npm

DESCRIPTION="ssf is a pure JS library to format data using ECMA-376 spreadsheet format codes"
HOMEPAGE="https://github.com/SheetJS/ssf"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/frac
"
