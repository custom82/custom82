# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-loader"
inherit npm

DESCRIPTION="Network request and file loading utilities"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-dsv
        dev-nodejs/topojson-client
        dev-nodejs/vega-format
        dev-nodejs/vega-util
"
