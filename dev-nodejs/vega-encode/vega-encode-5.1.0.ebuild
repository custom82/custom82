# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-encode"
inherit npm

DESCRIPTION="This package provides the following Vega data transforms"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
        dev-nodejs/d3-interpolate
        dev-nodejs/vega-dataflow
        dev-nodejs/vega-scale
        dev-nodejs/vega-util
"
