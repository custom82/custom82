# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-parser"
inherit npm

DESCRIPTION="Parse Vega specifications to runtime dataflow descriptions"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vega-dataflow
        dev-nodejs/vega-event-selector
        dev-nodejs/vega-functions
        dev-nodejs/vega-scale
        dev-nodejs/vega-util
"
