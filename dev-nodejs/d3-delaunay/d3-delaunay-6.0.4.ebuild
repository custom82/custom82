# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-delaunay"
inherit npm

DESCRIPTION="This is a fast library for computing the Voronoi diagram of a set of two-dimensional points"
HOMEPAGE="https://github.com/d3/d3-delaunay"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/delaunator
"
