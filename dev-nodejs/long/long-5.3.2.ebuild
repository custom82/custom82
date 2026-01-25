# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="long"
inherit npm

DESCRIPTION="Guid Typescript is library that let you generate guid code"
HOMEPAGE="https://github.com/dcodeIO/long.js"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="index.js umd types.d.ts index.d.ts"
