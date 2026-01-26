# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="chevrotain-allstar"
inherit npm

DESCRIPTION="This is a lookahead plugin package for the Chevrotain parser library"
HOMEPAGE="https://github.com/langium/chevrotain-allstar"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/lodash-es
"
