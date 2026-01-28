# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@jridgewell/gen-mapping"
inherit npm

DESCRIPTION="gen-mapping allows you to generate a source map during transpilation or minification"
HOMEPAGE="https://github.com/tailwindlabs/tailwindcss"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/jridgewell-sourcemap-codec
        dev-nodejs/jridgewell-trace-mapping
"
