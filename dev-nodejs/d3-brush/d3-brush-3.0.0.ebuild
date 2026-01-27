# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-brush"
inherit npm

DESCRIPTION="Brushing is the interactive specification a one- or two-dimensional selected region using a pointing gesture"
HOMEPAGE="https://github.com/d3/d3-brush"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-dispatch
        dev-nodejs/d3-drag
        dev-nodejs/d3-interpolate
        dev-nodejs/d3-selection
        dev-nodejs/d3-transition
"
