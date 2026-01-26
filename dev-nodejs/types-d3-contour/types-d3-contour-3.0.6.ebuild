# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@types/d3-contour"
inherit npm

DESCRIPTION="This package contains type definitions for d3-contour"
HOMEPAGE="https://github.com/DefinitelyTyped/DefinitelyTyped"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-d3-array
        dev-nodejs/types-d3-geojson
"
