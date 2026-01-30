# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="svelte-check"
inherit npm

DESCRIPTION="Check your code with svelte-check"
HOMEPAGE="https://github.com/sveltejs/language-tools"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/jridgewell-trace-mapping
        dev-nodejs/chokidar
        dev-nodejs/fdir
        dev-nodejs/picocolors
        dev-nodejs/sade
"
