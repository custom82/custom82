# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="restore-cursor"
inherit npm

DESCRIPTION="Gracefully restore the CLI cursor on exit"
HOMEPAGE="https://github.com/sindresorhus/restore-cursor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/onetime
        dev-nodejs/signal-exit
"
