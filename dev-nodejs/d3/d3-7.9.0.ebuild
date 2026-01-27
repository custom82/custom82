# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3"
inherit npm

DESCRIPTION="Data-Driven Documents"
HOMEPAGE="https://github.com/d3/d3"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
        dev-nodejs/d3-axis
        dev-nodejs/d3-brush
        dev-nodejs/d3-chord
        dev-nodejs/d3-color
        dev-nodejs/d3-contour
        dev-nodejs/d3-delaunay
        dev-nodejs/d3-dispatch
        dev-nodejs/d3-drag
        dev-nodejs/d3-dsv
        dev-nodejs/d3-ease
        dev-nodejs/d3-fetch
        dev-nodejs/d3-force
        dev-nodejs/d3-format
        dev-nodejs/d3-geo
        dev-nodejs/d3-hierarchy
        dev-nodejs/d3-interpolate
        dev-nodejs/d3-path
        dev-nodejs/d3-polygon
        dev-nodejs/d3-quadtree
        dev-nodejs/d3-random
        dev-nodejs/d3-scale
        dev-nodejs/d3-scale-chromatic
        dev-nodejs/d3-selection
        dev-nodejs/d3-shape
        dev-nodejs/d3-time
        dev-nodejs/d3-time-format
        dev-nodejs/d3-timer
        dev-nodejs/d3-transition
        dev-nodejs/d3-zoom
"
