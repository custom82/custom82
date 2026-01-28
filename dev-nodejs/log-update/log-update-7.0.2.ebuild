# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="log-update"
inherit npm

DESCRIPTION="og by overwriting the previous output in the terminal"
HOMEPAGE="https://github.com/sindresorhus/log-update"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/ansi-escapes
        dev-nodejs/cli-cursor
        dev-nodejs/slice-ansi
        dev-nodejs/strip-ansi
        dev-nodejs/wrap-ansi
"
