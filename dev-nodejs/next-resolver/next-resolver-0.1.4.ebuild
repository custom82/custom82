# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="next-resolver"
inherit npm

DESCRIPTION="An Atomics based Proxy to simplify, and synchronize, Worker related tasks"
HOMEPAGE="https://github.com/WebReflection/next-resolver"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/webreflection-utils
"

