# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cli-truncate"
inherit npm

DESCRIPTION="Truncate a string to a specific width in the terminal"
HOMEPAGE="https://github.com/listr2/listr2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/slice-ansi
        dev-nodejs/string-width
"
