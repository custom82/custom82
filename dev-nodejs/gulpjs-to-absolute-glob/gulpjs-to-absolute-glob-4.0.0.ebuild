# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@gulpjs/to-absolute-glob"
inherit npm

DESCRIPTION="Make a glob pattern absolute, ensuring that negative globs and patterns with trailing slashes are correctly handled."
HOMEPAGE="https://github.com/gulpjs/to-absolute-glob"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/is-negated-glob
"
