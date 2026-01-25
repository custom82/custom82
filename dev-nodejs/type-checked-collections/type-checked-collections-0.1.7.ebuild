# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="type-checked-collections"
inherit npm

DESCRIPTION="Collections that actually type-check at runtime, not only in IDEs"
HOMEPAGE="https://github.com/WebReflection/type-checked-collections"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="index.js es.js esm cjs"
