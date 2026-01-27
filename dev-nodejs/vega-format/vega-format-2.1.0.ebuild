# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-format"
inherit npm

DESCRIPTION="String formatting utilities for number and date values"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
        dev-nodejs/d3-format
        dev-nodejs/d3-time-format
        dev-nodejs/vega-time
        dev-nodejs/vega-util
"
