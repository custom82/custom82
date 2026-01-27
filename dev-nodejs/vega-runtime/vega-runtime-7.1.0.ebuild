# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-runtime"
inherit npm

DESCRIPTION="Runtime support for Vega dataflows. Parses a runtime dataflow description produced by vega-parser to instantiate a live vega-dataflow instance"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vega-dataflow
        dev-nodejs/vega-util
"
