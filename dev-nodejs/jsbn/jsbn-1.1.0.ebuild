# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="jsbn"
inherit npm

DESCRIPTION="I felt compelled to put this on github and publish to npm"
HOMEPAGE="https://github.com/andyperlitch/jsbn"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/assert-plus
"
