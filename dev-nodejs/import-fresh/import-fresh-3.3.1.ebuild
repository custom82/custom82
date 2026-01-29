# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="import-fresh"
inherit npm

DESCRIPTION="Import a module while bypassing the cache"
HOMEPAGE="https://github.com/sindresorhus/import-fresh"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/parent-module
        dev-nodejs/resolve-from
"

