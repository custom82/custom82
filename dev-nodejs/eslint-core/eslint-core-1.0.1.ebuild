# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@eslint/core"
inherit npm

DESCRIPTION="This package is the future home of the rewritten, runtime-agnostic ESLint core"
HOMEPAGE="https://github.com/eslint/rewrite"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-json-schema
"
