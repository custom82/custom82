# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@webreflection/idb-map"
inherit npm

DESCRIPTION="An IndexedDB based Map with an asynchronous interface"
HOMEPAGE="https://github.com/WebReflection/idb-map"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="sync.js index.js sync.cjs index.cjs"
