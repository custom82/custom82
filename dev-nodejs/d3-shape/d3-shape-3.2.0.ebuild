# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-shape"
inherit npm

DESCRIPTION="Visualizations typically consist of discrete graphical marks"
HOMEPAGE="https://github.com/d3/d3-shape"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-path
"
