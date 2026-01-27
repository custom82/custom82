# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega"
inherit npm

DESCRIPTION="Vega is a visualization grammar, a declarative format for creating, saving, and sharing interactive visualization designs"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vega-crossfilter
        dev-nodejs/vega-dataflow
        dev-nodejs/vega-encode
        dev-nodejs/vega-event-selector
        dev-nodejs/vega-expression
        dev-nodejs/vega-force
        dev-nodejs/vega-format
        dev-nodejs/vega-functions
        dev-nodejs/vega-geo
        dev-nodejs/vega-hierarchy
        dev-nodejs/vega-label
        dev-nodejs/vega-loader
        dev-nodejs/vega-parser
        dev-nodejs/vega-projection
        dev-nodejs/vega-regression
        dev-nodejs/vega-runtime
        dev-nodejs/vega-scale
        dev-nodejs/vega-scenegraph
        dev-nodejs/vega-statistics
        dev-nodejs/vega-time
        dev-nodejs/vega-transforms
        dev-nodejs/vega-typings
        dev-nodejs/vega-util
        dev-nodejs/vega-view
        dev-nodejs/vega-view-transforms
        dev-nodejs/vega-voronoi
        dev-nodejs/vega-wordcloud
"
