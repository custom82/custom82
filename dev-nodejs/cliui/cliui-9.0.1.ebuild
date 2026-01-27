# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cliui"
inherit npm

DESCRIPTION="easily create complex multi-column command-line-interfaces"
HOMEPAGE="https://github.com/yargs/cliui"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/string-width
        dev-nodejs/strip-ansi
        dev-nodejs/wrap-ansi
"
