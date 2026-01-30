# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="teex"
inherit npm

DESCRIPTION="Turn a readable stream into multiple readable streamx streams"
HOMEPAGE="https://github.com/gulpjs/replace-ext"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/streamx
"
