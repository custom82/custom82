# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="quick-temp"
inherit npm

DESCRIPTION="Create and remove temporary directories"
HOMEPAGE="https://github.com/joliss/node-quick-temp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/mktemp
        dev-nodejs/rimraf
        dev-nodejs/underscore-string
"
