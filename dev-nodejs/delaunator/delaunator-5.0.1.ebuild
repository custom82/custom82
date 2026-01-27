# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="delaunator"
inherit npm

DESCRIPTION="An incredibly fast and robust JavaScript library for Delaunay triangulation of 2D points."
HOMEPAGE="https://github.com/mapbox/delaunator"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/robust-predicates
"
