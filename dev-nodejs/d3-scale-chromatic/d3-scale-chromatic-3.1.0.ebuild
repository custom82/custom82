# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-scale-chromatic"
inherit npm

DESCRIPTION="This module provides sequential, diverging and categorical color schemes designed to work with d3-scale’s scaleOrdinal and scaleSequential"
HOMEPAGE="https://github.com/d3/d3-scale-chromatic"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-color
        dev-nodejs/d3-interpolate
"
