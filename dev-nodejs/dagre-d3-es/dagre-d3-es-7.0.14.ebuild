# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="dagre-d3-es"
inherit npm

DESCRIPTION="dagre-d3-es is a fork of dagre-d3 using the more modern ES6 javascript syntax"
HOMEPAGE="https://github.com/tbo47/dagre-es"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3
        dev-nodejs/lodash-es
"
