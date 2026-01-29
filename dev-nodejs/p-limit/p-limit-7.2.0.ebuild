# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="p-limit"
inherit npm

DESCRIPTION="Run multiple promise-returning & async functions with limited concurrency"
HOMEPAGE="https://github.com/sindresorhus/p-limit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/yocto-queue
"
