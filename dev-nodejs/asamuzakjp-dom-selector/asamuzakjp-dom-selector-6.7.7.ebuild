# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@asamuzakjp/dom-selector"
inherit npm

DESCRIPTION="A CSS selector engine"
HOMEPAGE="https://github.com/asamuzaK/domSelector"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/asamuzakjp-nwsapi
        dev-nodejs/bidi-js
        dev-nodejs/css-tree
        dev-nodejs/is-potential-custom-element-name
        dev-nodejs/lru-cache
"
