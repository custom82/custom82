# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@floating-ui/dom"
inherit npm

DESCRIPTION="This is the library to use Floating UI on the web, wrapping @floating-ui/core with DOM interface logic"
HOMEPAGE="https://github.com/floating-ui/floating-ui"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/floating-ui-core
        dev-nodejs/floating-ui-utils
"
