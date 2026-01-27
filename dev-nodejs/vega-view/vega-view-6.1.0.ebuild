# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-view"
inherit npm

DESCRIPTION="View component for Vega visualizations"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
        dev-nodejs/d3-timer
        dev-nodejs/vega-dataflow
        dev-nodejs/vega-format
        dev-nodejs/vega-functions
        dev-nodejs/vega-runtime
        dev-nodejs/vega-scenegraph
        dev-nodejs/vega-util
"
