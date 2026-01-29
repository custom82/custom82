# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@types/minimatch"
inherit npm

DESCRIPTION="This is a stub types definition for @types/minimatch"
HOMEPAGE="https://www.npmjs.com/package/@types/minimatch"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/minimatch
"
