# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="word"
inherit npm

DESCRIPTION="Parser and writer for various word processing doc formats"
HOMEPAGE="https://github.com/SheetJS/frac"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cfb
        dev-nodejs/jsdom
"
