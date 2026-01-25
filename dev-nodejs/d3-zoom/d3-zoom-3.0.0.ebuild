# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-zoom"
inherit npm

DESCRIPTION="Panning and zooming are popular interaction techniques which let the user focus on a region of interest by restricting the view"
HOMEPAGE="https://github.com/d3/d3-zoom"

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
