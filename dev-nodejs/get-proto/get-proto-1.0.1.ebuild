# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="get-proto"
inherit npm

DESCRIPTION="Robustly get the [[Prototype]] of an object. Uses the best available method"
HOMEPAGE="https://github.com/ljharb/get-proto"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/dunder-proto
        dev-nodejs/es-object-atoms
"
