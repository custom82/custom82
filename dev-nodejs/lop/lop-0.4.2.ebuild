# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="lop"
inherit npm

DESCRIPTION="lop is a library to create parsers using parser combinators with helpful errors"
HOMEPAGE="https://github.com/mwilliamson/lop"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/duck
        dev-nodejs/option
        dev-nodejs/underscore
"

NPM_EXTRA_FILES="index.js lib test"
