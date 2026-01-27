# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="panzoom"
inherit npm

DESCRIPTION="Extensible, mobile friendly pan and zoom framework"
HOMEPAGE="https://github.com/anvaka/panzoom"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/amator
        dev-nodejs/ngraph-events
        dev-nodejs/wheel
"
