# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="getpass"
inherit npm

DESCRIPTION="Get a password from the terminal"
HOMEPAGE="https://github.com/arekinath/node-getpass"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/assert-plus
"
