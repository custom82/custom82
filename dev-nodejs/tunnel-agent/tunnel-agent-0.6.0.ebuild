# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="tunnel-agent"
inherit npm

DESCRIPTION="HTTP proxy tunneling agent. Formerly part of mikeal/request, now a standalone module"
HOMEPAGE="https://github.com/mikeal/tunnel-agent"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/safe-buffer
"
