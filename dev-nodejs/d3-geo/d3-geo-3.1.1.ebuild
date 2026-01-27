# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-geo"
inherit npm

DESCRIPTION="This module uses spherical GeoJSON to represent geographic features in JavaScript"
HOMEPAGE="https://github.com/d3/d3-geo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
"
