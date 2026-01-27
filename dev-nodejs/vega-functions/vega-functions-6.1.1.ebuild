# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-functions"
inherit npm

DESCRIPTION="Function implementations for the Vega expression language"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
        dev-nodejs/d3-color
        dev-nodejs/d3-geo
        dev-nodejs/vega-dataflow
        dev-nodejs/vega-expression
        dev-nodejs/vega-scale
        dev-nodejs/vega-scenegraph
        dev-nodejs/vega-selections
        dev-nodejs/vega-statistics
        dev-nodejs/vega-time
        dev-nodejs/vega-util
"
