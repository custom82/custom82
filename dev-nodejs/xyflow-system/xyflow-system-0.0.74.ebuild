# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@xyflow/system"
inherit npm

DESCRIPTION="Core system utilities powering React Flow and Svelte Flow"
HOMEPAGE="https://github.com/xyflow/xyflow"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-d3-drag
        dev-nodejs/types-d3-interpolate
        dev-nodejs/types-d3-selection
        dev-nodejs/types-d3-transition
        dev-nodejs/types-d3-zoom
        dev-nodejs/d3-drag
        dev-nodejs/d3-interpolate
        dev-nodejs/d3-selection
        dev-nodejs/d3-zoom
"
