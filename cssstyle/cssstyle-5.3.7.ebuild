# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cssstyle"
inherit npm

DESCRIPTION="A Node.js implementation of the CSS Object Model CSSStyleDeclaration class"
HOMEPAGE="https://github.com/jsdom/cssstyle"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/asamuzakjp-css-color
        dev-nodejs/csstools-css-syntax-patches-for-csstree
        dev-nodejs/css-tree
        dev-nodejs/lru-cache
"
