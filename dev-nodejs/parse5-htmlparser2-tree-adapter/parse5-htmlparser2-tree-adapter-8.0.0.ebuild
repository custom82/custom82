# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="parse5-htmlparser2-tree-adapter"
inherit npm

DESCRIPTION="htmlparser2 tree adapter for parse5"
HOMEPAGE="https://github.com/inikulin/parse5"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/domhandler
        dev-nodejs/parse5
"
