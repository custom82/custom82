# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vinyl"
inherit npm

DESCRIPTION="Vinyl is a very simple metadata object that describes a file"
HOMEPAGE="https://github.com/gulpjs/vinyl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/clone
        dev-nodejs/remove-trailing-separator
        dev-nodejs/replace-ext
        dev-nodejs/teex
"
