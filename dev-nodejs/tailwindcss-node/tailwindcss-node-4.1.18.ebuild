# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@tailwindcss/node"
inherit npm

DESCRIPTION="A utility-first CSS framework for rapidly building custom user interfaces"
HOMEPAGE="https://github.com/tailwindlabs/tailwindcss"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/jridgewell-remapping
        dev-nodejs/enhanced-resolve
        dev-nodejs/jiti
        dev-nodejs/lightningcss
        dev-nodejs/magic-string
        dev-nodejs/source-map-js
        dev-nodejs/tailwindcss
"

