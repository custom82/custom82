# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="runed"
inherit npm

DESCRIPTION="Runed provides utilities to power your applications using the magic of Svelte Runes"
HOMEPAGE="https://github.com/svecosystem/runed"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/dequal
        dev-nodejs/esm-env
        dev-nodejs/lz-string
"
