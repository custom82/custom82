# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="eslint"
inherit npm

DESCRIPTION="ESLint is a tool for identifying and reporting on patterns found in ECMAScript/JavaScript code"
HOMEPAGE="https://github.com/eslint/eslint"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/eslint-community-eslint-utils
        dev-nodejs/eslint-community-regexpp
        dev-nodejs/eslint-config-array
        dev-nodejs/eslint-config-helpers
        dev-nodejs/eslint-core
        dev-nodejs/eslint-eslintrc
        dev-nodejs/eslint-js
        dev-nodejs/eslint-plugin-kit
        dev-nodejs/humanfs-node
        dev-nodejs/humanwhocodes-module-importer
        dev-nodejs/humanwhocodes-retry
        dev-nodejs/types-estree
        dev-nodejs/ajv
        dev-nodejs/chalk
        dev-nodejs/cross-spawn
        dev-nodejs/debug
        dev-nodejs/escape-string-regexp
        dev-nodejs/eslint-scope
        dev-nodejs/eslint-visitor-keys
        dev-nodejs/espree
        dev-nodejs/esquery
        dev-nodejs/esutils
        dev-nodejs/fast-deep-equal
        dev-nodejs/file-entry-cache
        dev-nodejs/find-up
        dev-nodejs/glob-parent
        dev-nodejs/ignore
        dev-nodejs/imurmurhash
        dev-nodejs/is-glob
        dev-nodejs/json-stable-stringify-without-jsonify
        dev-nodejs/lodash-merge
        dev-nodejs/minimatch
        dev-nodejs/natural-compare
        dev-nodejs/optionator
"
