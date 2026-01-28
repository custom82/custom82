# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@typescript-eslint/scope-manager"
inherit npm

DESCRIPTION="the tooling that allows you to run ESLint and Prettier on TypeScript code"
HOMEPAGE="https://github.com/typescript-eslint/typescript-eslint"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/typescript-eslint-types
        dev-nodejs/typescript-eslint-visitor-keys
"
