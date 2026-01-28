# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@typescript-eslint/project-service"
inherit npm

DESCRIPTION="Standalone TypeScript project service wrapper for linting"
HOMEPAGE="https://github.com/typescript-eslint/typescript-eslint"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/typescript-eslint-tsconfig-utils
        dev-nodejs/typescript-eslint-types
"
