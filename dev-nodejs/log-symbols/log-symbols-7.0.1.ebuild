# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="log-symbols"
inherit npm

DESCRIPTION="Colored symbols for various log levels"
HOMEPAGE="https://github.com/sindresorhus/log-symbols"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/is-unicode-supported
        dev-nodejs/yoctocolors
"
