# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="tippy.js"
inherit npm

DESCRIPTION="The complete tooltip, popover, dropdown, and menu solution for the web"
HOMEPAGE="https://github.com/atomiks/tippyjs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/popperjs-core
"
