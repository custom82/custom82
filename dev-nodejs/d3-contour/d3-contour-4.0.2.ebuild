# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-contour"
inherit npm

DESCRIPTION="This library computes contour polygons by applying marching squares to a rectangular array of numeric values"
HOMEPAGE="https://github.com/d3/d3-contour"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
"
