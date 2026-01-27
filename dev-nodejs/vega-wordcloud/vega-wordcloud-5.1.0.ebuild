# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-wordcloud"
inherit npm

DESCRIPTION="Wordcloud layout algorithm for Vega dataflows"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vega-canvas
        dev-nodejs/vega-dataflow
        dev-nodejs/vega-scale
        dev-nodejs/vega-statistics
        dev-nodejs/vega-util
"
