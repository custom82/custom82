# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="hasha"
inherit npm

DESCRIPTION="Hashing made simple. Get the hash of a buffer/string/stream/file"
HOMEPAGE="https://github.com/sindresorhus/hasha"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/is-stream
        dev-nodejs/type-fest
"
