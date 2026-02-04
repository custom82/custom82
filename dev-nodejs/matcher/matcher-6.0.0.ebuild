# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="matcher"
inherit npm

DESCRIPTION="Simple wildcard matching"
HOMEPAGE="https://github.com/sindresorhus/matcher"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/escape-string-regexp
"
