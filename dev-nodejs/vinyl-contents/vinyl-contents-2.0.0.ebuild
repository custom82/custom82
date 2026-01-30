# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vinyl-contents"
inherit npm

DESCRIPTION="Utility to read the contents of a vinyl file"
HOMEPAGE="https://github.com/gulpjs/vinyl-contents"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
         dev-nodejs/bl
         dev-nodejs/vinyl
"
