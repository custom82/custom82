# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="walk-sync"
inherit npm

DESCRIPTION="Return an array containing all recursive files and directories under a given directory, similar to Unix find"
HOMEPAGE="https://github.com/joliss/node-walk-sync"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-minimatch
        dev-nodejs/ensure-posix-path
        dev-nodejs/matcher-collection
        dev-nodejs/minimatch
"
