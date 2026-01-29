# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="locate-path"
inherit npm

DESCRIPTION="Get the first path that exists on disk of multiple paths"
HOMEPAGE="https://github.com/sindresorhus/locate-path"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/p-locate
"
