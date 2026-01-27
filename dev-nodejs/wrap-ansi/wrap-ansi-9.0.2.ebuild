# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="wrap-ansi"
inherit npm

DESCRIPTION="Wordwrap a string with ANSI escape codes"
HOMEPAGE="https://github.com/chalk/wrap-ansi"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/ansi-styles
        dev-nodejs/string-width
        dev-nodejs/strip-ansi
"
