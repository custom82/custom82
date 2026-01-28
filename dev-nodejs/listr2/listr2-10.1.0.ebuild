# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="listr2"
inherit npm

DESCRIPTION="Create beautiful CLI interfaces via easy and logical to-implement task lists that feel alive and interactive"
HOMEPAGE="https://github.com/listr2/listr2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cli-truncate
        dev-nodejs/colorette
        dev-nodejs/eventemitter3
        dev-nodejs/log-update
        dev-nodejs/rfdc
        dev-nodejs/wrap-ansi
"
