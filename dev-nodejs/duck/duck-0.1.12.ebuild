# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="duck"
inherit npm

DESCRIPTION="duck.js allows you to perform assertions on complex objects"
HOMEPAGE="https://github.com/mwilliamson/duck.js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/underscore
"


