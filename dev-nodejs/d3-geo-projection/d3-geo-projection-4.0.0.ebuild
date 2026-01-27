# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-geo-projection"
inherit npm

DESCRIPTION="Extended geographic projections for d3-geo"
HOMEPAGE="https://github.com/d3/d3-geo-projection"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/commander
        dev-nodejs/d3-array
        dev-nodejs/d3-geo
"

