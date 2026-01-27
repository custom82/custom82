# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-scale"
inherit npm

DESCRIPTION="Scales are a convenient abstraction for a fundamental task in visualization"
HOMEPAGE="https://github.com/d3/d3-scale"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
        dev-nodejs/d3-format
        dev-nodejs/d3-interpolate
        dev-nodejs/d3-time
        dev-nodejs/d3-time-format
"
