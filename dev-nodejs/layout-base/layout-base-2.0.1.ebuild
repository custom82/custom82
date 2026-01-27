# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="layout-base"
inherit npm

DESCRIPTION="This repository implements a basic layout model and some utilities for Cytoscape.js layout extensions"
HOMEPAGE="https://github.com/iVis-at-Bilkent/layout-base"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/layout-base
"
