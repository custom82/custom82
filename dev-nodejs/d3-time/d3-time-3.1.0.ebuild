# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-time"
inherit npm

DESCRIPTION="When visualizing time series data, analyzing temporal patterns, or working with time in general, the irregularities of conventional time units quickly become apparent"
HOMEPAGE="https://github.com/d3/d3-time"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
"
