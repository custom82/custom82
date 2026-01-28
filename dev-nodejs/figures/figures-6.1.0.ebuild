# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="figures"
inherit npm

DESCRIPTION="Unicode symbols with fallbacks for older terminals"
HOMEPAGE="https://github.com/sindresorhus/figures"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/is-unicode-supported
"
