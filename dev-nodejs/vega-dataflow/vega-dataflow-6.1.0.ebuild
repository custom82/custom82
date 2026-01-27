# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-dataflow"
inherit npm

DESCRIPTION="Defines a reactive dataflow graph that can process both scalar values and streaming relational data"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vega-format
        dev-nodejs/vega-loader
        dev-nodejs/vega-util
"
