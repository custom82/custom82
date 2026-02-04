# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@csstools/css-color-parser"
inherit npm

DESCRIPTION="CSS Color Parser"
HOMEPAGE="https://github.com/csstools/postcss-plugins"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/csstools-color-helpers
        dev-nodejs/csstools-css-calc
"
