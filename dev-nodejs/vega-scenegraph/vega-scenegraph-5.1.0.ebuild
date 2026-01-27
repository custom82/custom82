# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-scenegraph"
inherit npm

DESCRIPTION="Vega scenegraph and renderers"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-path
        dev-nodejs/d3-shape
        dev-nodejs/vega-canvas
        dev-nodejs/vega-loader
        dev-nodejs/vega-scale
        dev-nodejs/vega-util
"
