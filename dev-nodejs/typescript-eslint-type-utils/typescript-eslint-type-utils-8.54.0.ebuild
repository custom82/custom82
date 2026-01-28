# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@typescript-eslint/type-utils"
inherit npm

DESCRIPTION="Type utilities for working with TypeScript within ESLint rules"
HOMEPAGE="https://github.com/typescript-eslint/typescript-eslint"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/typescript-eslint-types
        dev-nodejs/typescript-eslint-typescript-estree
        dev-nodejs/typescript-eslint-utils
        dev-nodejs/debug
        dev-nodejs/ts-api-utils
"
