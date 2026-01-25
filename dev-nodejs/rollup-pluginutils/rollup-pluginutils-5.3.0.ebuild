# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@rollup/pluginutils"
inherit npm

DESCRIPTION="A set of utility functions commonly used by 🍣 Rollup plugins"
HOMEPAGE="https://github.com/rollup/plugins"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-estree
        dev-nodejs/estree-walker
        dev-nodejs/picomatch
"
