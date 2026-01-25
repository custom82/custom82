# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@vue/reactivity"
inherit npm

DESCRIPTION="This package is inlined into Global & Browser ESM builds of user-facing renderers"
HOMEPAGE="https://github.com/vuejs/core"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vue-shared
"
