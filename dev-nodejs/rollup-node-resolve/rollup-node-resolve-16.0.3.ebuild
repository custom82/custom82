# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@rollup/plugin-node-resolve"
inherit npm

DESCRIPTION="TA Rollup plugin which locates modules using the Node resolution algorithm"
HOMEPAGE="https://github.com/rollup/plugins"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-resolve
        dev-nodejs/deepmerge
        dev-nodejs/is-module
        dev-nodejs/resolve
"

