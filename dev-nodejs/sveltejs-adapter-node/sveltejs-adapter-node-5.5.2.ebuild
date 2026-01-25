# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@sveltejs/adapter-node"
inherit npm

DESCRIPTION="Adapter for SvelteKit apps that generates a standalone Node server"
HOMEPAGE="https://github.com/sveltejs/kit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/rollup-plugin-commonjs
        dev-nodejs/rollup-plugin-json
        dev-nodejs/rollup-plugin-node-resolve
        dev-nodejs/rollup
"


