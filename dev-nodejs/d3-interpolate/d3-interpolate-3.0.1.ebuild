# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-interpolate"
inherit npm

DESCRIPTION="This module provides a variety of interpolation methods for blending between two values"
HOMEPAGE="https://github.com/d3/d3-interpolate"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-color
"
