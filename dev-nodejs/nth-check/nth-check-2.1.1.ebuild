# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="nth-check"
inherit npm

DESCRIPTION="Parses and compiles CSS nth-checks to highly optimized functions"
HOMEPAGE="https://github.com/fb55/nth-check"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/boolbase
"
