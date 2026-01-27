# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-hierarchy"
inherit npm

DESCRIPTION="Many datasets are intrinsically hierarchical"
HOMEPAGE="https://github.com/d3/d3-hierarchy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-array
"
