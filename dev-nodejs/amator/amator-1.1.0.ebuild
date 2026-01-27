# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="amator"
inherit npm

DESCRIPTION="Tiny animation library"
HOMEPAGE="https://github.com/anvaka/amator"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/bezier-easing
"
