# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="pretty-ms"
inherit npm

DESCRIPTION="Convert milliseconds to a human readable string"
HOMEPAGE="https://github.com/sindresorhus/pretty-ms"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/parse-ms
"
