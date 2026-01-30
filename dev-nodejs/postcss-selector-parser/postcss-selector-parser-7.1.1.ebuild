# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="postcss-selector-parser"
inherit npm

DESCRIPTION="Selector parser with built in methods for working with selector strings"
HOMEPAGE="https://github.com/postcss/postcss-selector-parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cssesc
        dev-nodejs/util-deprecate
"
