# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="qs"
inherit npm

DESCRIPTION="A querystring parsing and stringifying library with some added security"
HOMEPAGE="https://github.com/ljharb/qs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/side-channel
"
