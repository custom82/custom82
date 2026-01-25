# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@types/estree"
inherit npm

DESCRIPTION="This package contains type definitions for estree"
HOMEPAGE="https://github.com/DefinitelyTyped/DefinitelyTyped"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="index.d.ts flow.d.ts"



