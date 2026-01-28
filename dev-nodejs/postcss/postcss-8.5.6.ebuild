# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="postcss"
inherit npm

DESCRIPTION=""
HOMEPAGE="https://github.com/tailwindlabs/tailwindcss"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/nanoid
        dev-nodejs/picocolors
        dev-nodejs/source-map-js
"
