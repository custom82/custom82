# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@eslint/eslintrc"
inherit npm

DESCRIPTION="This repository contains the legacy ESLintRC configuration file format for ESLint"
HOMEPAGE="https://github.com/eslint/eslintrc"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/ajv
        dev-nodejs/debug
        dev-nodejs/espree
        dev-nodejs/globals
        dev-nodejs/ignore
        dev-nodejs/import-fresh
        dev-nodejs/js-yaml
        dev-nodejs/minimatch
        dev-nodejs/strip-json-comments
"
