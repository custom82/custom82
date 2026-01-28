# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="get-stream"
inherit npm

DESCRIPTION="Process execution for humans"
HOMEPAGE="https://github.com/sindresorhus/execa"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/sec-ant-readable-stream
        dev-nodejs/is-stream
"
