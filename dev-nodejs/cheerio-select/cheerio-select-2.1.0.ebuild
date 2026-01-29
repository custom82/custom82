# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cheerio-select"
inherit npm

DESCRIPTION="CSS selector engine supporting jQuery selectors, based on css-select"
HOMEPAGE="https://github.com/cheeriojs/cheerio-select"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/boolbase
        dev-nodejs/css-select
        dev-nodejs/css-what
        dev-nodejs/domelementtype
        dev-nodejs/domhandler
        dev-nodejs/domutils
"
