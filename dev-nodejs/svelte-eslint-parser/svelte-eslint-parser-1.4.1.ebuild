# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="svelte-eslint-parser"
inherit npm

DESCRIPTION="The svelte-eslint-parser aims to make it easy to create your own ESLint rules for Svelte"
HOMEPAGE="https://github.com/sveltejs/svelte-eslint-parser"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/eslint-scope
        dev-nodejs/eslint-visitor-keys
        dev-nodejs/espree
        dev-nodejs/postcss
        dev-nodejs/postcss-scss
        dev-nodejs/postcss-selector-parser
"
