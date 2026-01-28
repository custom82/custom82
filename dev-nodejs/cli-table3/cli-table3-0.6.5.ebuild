# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cli-table3"
inherit npm

DESCRIPTION="This utility allows you to render unicode-aided tables on the command line from your node.js scripts"
HOMEPAGE="https://github.com/cli-table/cli-table3"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/string-width
"
