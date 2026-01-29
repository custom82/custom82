# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@eslint/plugin-kit"
inherit npm

DESCRIPTION="A collection of utilities to help build ESLint plugins"
HOMEPAGE="https://github.com/eslint/rewrite"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/eslint-core
        dev-nodejs/levn
"
