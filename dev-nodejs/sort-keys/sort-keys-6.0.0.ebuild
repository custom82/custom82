# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="sort-keys"
inherit npm

DESCRIPTION="Useful to get a deterministically ordered object, as the order of keys can vary between engines"
HOMEPAGE="https://github.com/sindresorhus/sort-keys"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/is-plain-obj
"
