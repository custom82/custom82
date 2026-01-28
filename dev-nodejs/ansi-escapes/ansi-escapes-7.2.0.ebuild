# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="ansi-escapes"
inherit npm

DESCRIPTION="ANSI escape codes for manipulating the terminal"
HOMEPAGE="https://github.com/sindresorhus/ansi-escapes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/environment
"
