# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@sveltejs/kit"
inherit npm

DESCRIPTION="This is the SvelteKit framework and CLI"
HOMEPAGE="https://github.com/sveltejs/kit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/standard-schema-spec
        dev-nodejs/sveltejs-acorn-typescript
        dev-nodejs/types-cookie
        dev-nodejs/acorn
        dev-nodejs/cookie
        dev-nodejs/devalue
        dev-nodejs/esm-env
        dev-nodejs/kleur
        dev-nodejs/magic-string
        dev-nodejs/mrmime
        dev-nodejs/sade
        dev-nodejs/set-cookie-parser
        dev-nodejs/sirv
"
