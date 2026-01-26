# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="focus-trap"
inherit npm

DESCRIPTION="Trap focus within a DOM node"
HOMEPAGE="https://github.com/focus-trap/focus-trap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/tabbable
"
