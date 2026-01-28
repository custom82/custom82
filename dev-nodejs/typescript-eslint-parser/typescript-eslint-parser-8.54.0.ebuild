# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@typescript-eslint/parser"
inherit npm

DESCRIPTION="An ESLint parser which leverages TypeScript ESTree to allow for ESLint to lint TypeScript source code"
HOMEPAGE="https://github.com/typescript-eslint/typescript-eslint"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/typescript-eslint-scope-manager
        dev-nodejs/typescript-eslint-types
        dev-nodejs/typescript-eslint-typescript-estree
        dev-nodejs/typescript-eslint-visitor-keys
        dev-nodejs/debug
"
