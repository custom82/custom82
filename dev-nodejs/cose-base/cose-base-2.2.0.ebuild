# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cose-base"
inherit npm

DESCRIPTION="This is a core module for compound spring embedder based layout styles such as CoSE-Bilkent, fCoSE, and CiSE"
HOMEPAGE="https://github.com/iVis-at-Bilkent/cose-base"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/layout-base
"
