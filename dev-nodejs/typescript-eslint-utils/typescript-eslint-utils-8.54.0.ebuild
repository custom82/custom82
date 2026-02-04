# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@typescript-eslint/utils"
inherit npm

DESCRIPTION="Utilities for working with TypeScript + ESLint together"
HOMEPAGE="https://github.com/typescript-eslint/typescript-eslint"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/eslint-community-eslint-utils
        dev-nodejs/typescript-eslint-scope-manager
        dev-nodejs/typescript-eslint-types
        dev-nodejs/typescript-eslint-typescript-estree
"
