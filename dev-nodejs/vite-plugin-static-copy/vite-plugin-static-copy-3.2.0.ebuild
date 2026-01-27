# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vite-plugin-static-copy"
inherit npm

DESCRIPTION="rollup-plugin-copy for Vite with dev server support."
HOMEPAGE="https://github.com/sapphi-red/vite-plugin-static-copy"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/chokidar
        dev-nodejs/p-map
        dev-nodejs/picocolors
        dev-nodejs/tinyglobby
"
