# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-force"
inherit npm

DESCRIPTION="This module implements a velocity Verlet numerical integrator for simulating physical forces on particles"
HOMEPAGE="https://github.com/d3/d3-fetch"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-dispatch
        dev-nodejs/d3-quadtree
        dev-nodejs/d3-timer
"
