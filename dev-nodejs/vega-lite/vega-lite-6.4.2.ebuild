# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-lite"
inherit npm

DESCRIPTION="Canvas and Image object instantiation utilities"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/json-stringify-pretty-compact
        dev-nodejs/tslib
        dev-nodejs/vega-event-selector
        dev-nodejs/vega-expression
        dev-nodejs/vega-util
        dev-nodejs/yargs
"

