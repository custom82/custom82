# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="tr46"
inherit npm

DESCRIPTION="An JavaScript implementation of Unicode Technical Standard #46"
HOMEPAGE="https://github.com/jsdom/tr46"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/punycode
"
