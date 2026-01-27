# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-typings"
inherit npm

DESCRIPTION="Typings for Vega"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-geojson
        dev-nodejs/vega-event-selector
        dev-nodejs/vega-expression
        dev-nodejs/vega-util
"
