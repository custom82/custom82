# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@asamuzakjp/css-color"
inherit npm

DESCRIPTION="Resolve and convert CSS colors"
HOMEPAGE="https://github.com/asamuzaK/cssColor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/csstools-css-calc
        dev-nodejs/csstools-css-color-parser
        dev-nodejs/csstools-css-parser-algorithms
        dev-nodejs/csstools-css-tokenizer
"
