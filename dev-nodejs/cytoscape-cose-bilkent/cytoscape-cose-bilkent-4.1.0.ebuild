# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cytoscape-cose-bilkent"
inherit npm

DESCRIPTION="The CoSE layout for Cytoscape.js developed by i-Vis Lab in Bilkent University is a spring embedder layout with support for compound graphs and varying node dimensions"
HOMEPAGE="https://github.com/cytoscape/cytoscape.js-cose-bilkent"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cose-base
"
