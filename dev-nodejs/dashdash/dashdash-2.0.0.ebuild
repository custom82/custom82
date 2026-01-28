# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="dashdash"
inherit npm

DESCRIPTION="A light, featureful and explicit option parsing library for node.js"
HOMEPAGE="https://github.com/trentm/node-dashdash"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/assert-plus
"
