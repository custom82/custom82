# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-transition"
inherit npm

DESCRIPTION="A transition is a selection-like interface for animating changes to the DOM"
HOMEPAGE="https://github.com/d3/d3-transition"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-color
        dev-nodejs/d3-ease
        dev-nodejs/d3-interpolate
        dev-nodejs/d3-timer
        dev-nodejs/d3-transition
"
