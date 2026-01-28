# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@typescript-eslint/eslint-plugin"
inherit npm

DESCRIPTION="An ESLint plugin which provides lint rules for TypeScript codebases"
HOMEPAGE="https://github.com/typescript-eslint/typescript-eslint"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/eslint-community-regexpp
        dev-nodejs/typescript-eslint-scope-manager
        dev-nodejs/typescript-eslint-type-utils
        dev-nodejs/typescript-eslint-utils
        dev-nodejs/typescript-eslint-visitor-keys
        dev-nodejs/ignore
        dev-nodejs/natural-compare
        dev-nodejs/ts-api-utils
"
