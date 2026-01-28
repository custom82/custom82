# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@sveltejs/vite-plugin-svelte"
inherit npm

DESCRIPTION=""
HOMEPAGE="https://github.com/sveltejs/vite-plugin-svelte"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/sveltejs-vite-plugin-svelte-inspector
        dev-nodejs/deepmerge
        dev-nodejs/magic-string
        dev-nodejs/obug
        dev-nodejs/vitefu
"
