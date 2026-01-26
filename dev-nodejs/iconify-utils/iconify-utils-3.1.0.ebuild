# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@iconify/utils"
inherit npm

DESCRIPTION="This is a set of helper functions that deal with Iconify icon sets"
HOMEPAGE="https://github.com/iconify/iconify"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/antfu-install-pkg
        dev-nodejs/iconify-types
        dev-nodejs/mlly
"
