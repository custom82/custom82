# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@floating-ui/core"
inherit npm

DESCRIPTION="This is the platform-agnostic core of Floating UI, exposing the main computePosition function but no platform interface logic"
HOMEPAGE="https://github.com/floating-ui/floating-ui"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/floating-ui-utils
"
