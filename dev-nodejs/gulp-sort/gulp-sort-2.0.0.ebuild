# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="gulp-sort"
inherit npm

DESCRIPTION="Sort files in stream by path or any custom sort comparator"
HOMEPAGE="https://github.com/pgilad/gulp-sort"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/through2
"
