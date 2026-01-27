# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="topojson-client"
inherit npm

DESCRIPTION="The topojson-client module provides tools for manipulating TopoJSON"
HOMEPAGE="https://github.com/topojson/topojson-client"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/commander
"
