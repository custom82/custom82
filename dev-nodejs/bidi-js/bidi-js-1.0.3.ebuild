# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="bidi-js"
inherit npm

DESCRIPTION="Fast CSS Selectors API Engine"
HOMEPAGE="https://github.com/lojjic/bidi-js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/require-from-string
"
