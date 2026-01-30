# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="p-locate"
inherit npm

DESCRIPTION="Get the first fulfilled promise that satisfies the provided testing function"
HOMEPAGE="https://github.com/sindresorhus/p-locate"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/p-limit
"
