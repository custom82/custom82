# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vite"
inherit npm

DESCRIPTION="Next Generation Frontend Tooling"
HOMEPAGE="https://github.com/vitejs/vite"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/esbuild
        dev-nodejs/fdir
        dev-nodejs/picomatch
        dev-nodejs/postcss
        dev-nodejs/rollup
        dev-nodejs/tinyglobby
"
