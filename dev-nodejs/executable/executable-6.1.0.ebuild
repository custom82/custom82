# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="executable"
inherit npm

DESCRIPTION="Check if a file is executable"
HOMEPAGE="https://github.com/kevva/executable"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/pify
"
