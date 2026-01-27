# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-hierarchy"
inherit npm

DESCRIPTION="Hierarchical layout transforms for Vega dataflows"
HOMEPAGE="https://github.com/d3/d3-geo-projection"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-hierarchy
        dev-nodejs/vega-dataflow
        dev-nodejs/vega-util
"

