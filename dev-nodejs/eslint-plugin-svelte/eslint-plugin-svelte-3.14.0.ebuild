# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="eslint-plugin-svelte"
inherit npm

DESCRIPTION="ESLint plugin for Svelte using AST"
HOMEPAGE="https://github.com/sveltejs/eslint-plugin-svelte"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/eslint-community-eslint-utils
        dev-nodejs/jridgewell-sourcemap-codec
        dev-nodejs/esutils
        dev-nodejs/globals
        dev-nodejs/known-css-properties
        dev-nodejs/postcss
        dev-nodejs/postcss-load-config
        dev-nodejs/postcss-safe-parser
        dev-nodejs/semver
        dev-nodejs/svelte-eslint-parser
"
