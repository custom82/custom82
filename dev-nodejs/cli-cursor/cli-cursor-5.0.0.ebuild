# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cli-cursor"
inherit npm

DESCRIPTION="Toggle the CLI cursor"
HOMEPAGE="https://github.com/sindresorhus/cli-cursor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/restore-cursor
"
