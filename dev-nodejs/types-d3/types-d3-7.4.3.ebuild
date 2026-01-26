# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@types/d3"
inherit npm

DESCRIPTION="This package contains type definitions for d3"
HOMEPAGE="https://github.com/DefinitelyTyped/DefinitelyTyped"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-d3-array
        dev-nodejs/types-d3-axis
        dev-nodejs/types-d3-brush
        dev-nodejs/types-d3-chord
        dev-nodejs/types-d3-color
        dev-nodejs/types-d3-contour
        dev-nodejs/types-d3-delaunay
        dev-nodejs/types-d3-dispatch
        dev-nodejs/types-d3-drag
        dev-nodejs/types-d3-dsv
        dev-nodejs/types-d3-ease
        dev-nodejs/types-d3-fetch
        dev-nodejs/types-d3-force
        dev-nodejs/types-d3-format
        dev-nodejs/types-d3-geo
        dev-nodejs/types-d3-hierarchy
        dev-nodejs/types-d3-interpolate
        dev-nodejs/types-d3-path
        dev-nodejs/types-d3-polygon
        dev-nodejs/types-d3-quadtree
        dev-nodejs/types-d3-random
        dev-nodejs/types-d3-scale
        dev-nodejs/types-d3-scale-chromatic
        dev-nodejs/types-d3-selection
        dev-nodejs/types-d3-shape
        dev-nodejs/types-d3-time
        dev-nodejs/types-d3-time-format
        dev-nodejs/types-d3-timer
        dev-nodejs/types-d3-transition
        dev-nodejs/types-d3-zoom
"
