# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="is-glob"
inherit npm

DESCRIPTION="Returns true if the given string looks like a glob pattern or an extglob pattern"
HOMEPAGE="https://github.com/micromatch/is-glob"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/is-extglob
"
