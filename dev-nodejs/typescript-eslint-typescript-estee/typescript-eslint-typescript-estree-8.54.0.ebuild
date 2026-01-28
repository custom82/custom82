# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@typescript-eslint/typescript-estree"
inherit npm

DESCRIPTION="A parser that produces an ESTree-compatible AST for TypeScript code"
HOMEPAGE="https://github.com/typescript-eslint/typescript-eslint"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/typescript-eslint-project-service
        dev-nodejs/typescript-eslint-tsconfig-utils
        dev-nodejs/typescript-eslint-types
        dev-nodejs/typescript-eslint-visitor-keys
        dev-nodejs/debug
        dev-nodejs/minimatch
        dev-nodejs/semver
        dev-nodejs/tinyglobby
        dev-nodejs/ts-api-utils
"
