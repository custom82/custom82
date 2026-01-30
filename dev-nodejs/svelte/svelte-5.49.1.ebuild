# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="svelte"
inherit npm

DESCRIPTION="Svelte is a new way to build web applications"
HOMEPAGE="https://github.com/sveltejs/svelte"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/jridgewell-remapping
        dev-nodejs/jridgewell-sourcemap-codec
        dev-nodejs/sveltejs-acorn-typescript
        dev-nodejs/types-estree
        dev-nodejs/acorn
        dev-nodejs/aria-query
        dev-nodejs/axobject-query
        dev-nodejs/clsx
        dev-nodejs/devalue
        dev-nodejs/esm-env
        dev-nodejs/esrap
        dev-nodejs/is-reference
        dev-nodejs/locate-character
        dev-nodejs/magic-string
        dev-nodejs/zimmerframe
"
