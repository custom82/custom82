# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@rollup/plugin-json"
inherit npm

DESCRIPTION="A Rollup plugin which Converts .json files to ES6 modules"
HOMEPAGE="https://github.com/rollup/plugins"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/rollup/pluginutils
"
