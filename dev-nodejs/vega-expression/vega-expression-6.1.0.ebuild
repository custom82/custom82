# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vega-expression"
inherit npm

DESCRIPTION="Vega expression parser and code generator"
HOMEPAGE="https://github.com/vega/vega"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-estree
        dev-nodejs/vega-util
"
