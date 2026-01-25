# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="bits-ui"
inherit npm

DESCRIPTION="Bits UI – the headless components for Svelte"
HOMEPAGE="https://github.com/huntabyte/bits-ui"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodens/floating-ui-core
        dev-nodejs/floating-ui-dom
        dev-nodejs/esm-env
        dev-nodejs/runed
        dev-nodejs/svelte-toolbelt
        dev-nodejs/tabbable
"

