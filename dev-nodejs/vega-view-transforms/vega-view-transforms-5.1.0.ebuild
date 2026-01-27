# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-view-transforms"
inherit npm

DESCRIPTION="This package provides the following Vega data transform"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vega-dataflow
        dev-nodejs/vega-scenegraph
        dev-nodejs/vega-util
"
