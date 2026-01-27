# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="strip-ansi"
inherit npm

DESCRIPTION="Strip ANSI escape codes from a string"
HOMEPAGE="https://github.com/chalk/strip-ansi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/ansi-regex
"
