# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="svelte-toolbelt"
inherit npm

DESCRIPTION="Utilities for Svelte 5 that I find useful and will use in the various projects I work on"
HOMEPAGE="https://www.npmjs.com/package/svelte-toolbelt"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/clsx
        dev-nodejs/runed
        dev-nodejs/style-to-object
"
