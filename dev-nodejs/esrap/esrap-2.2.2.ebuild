# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="esrap"
inherit npm

DESCRIPTION="Parse in reverse. AST goes in, code comes out"
HOMEPAGE="https://github.com/sveltejs/esrap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/jridgewell-sourcemap-codec
"
