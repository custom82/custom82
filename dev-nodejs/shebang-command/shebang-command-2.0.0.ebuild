# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="shebang-command"
inherit npm

DESCRIPTION="Get the command from a shebang"
HOMEPAGE="https://github.com/kevva/shebang-command"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/shebang-regex
"
