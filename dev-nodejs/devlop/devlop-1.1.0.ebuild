# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="devlop"
inherit npm

DESCRIPTION="Some tools to make developing easier while not including code in production"
HOMEPAGE="https://github.com/wooorm/devlop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/dequal
"
