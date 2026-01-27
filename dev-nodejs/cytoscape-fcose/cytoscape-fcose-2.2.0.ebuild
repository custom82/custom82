# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cytoscape-fcose"
inherit npm

DESCRIPTION="fCoSE is a faster version of our earlier compound spring embedder algorithm named CoSE"
HOMEPAGE="https://github.com/iVis-at-Bilkent/cytoscape.js-fcose"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cose-base
"
