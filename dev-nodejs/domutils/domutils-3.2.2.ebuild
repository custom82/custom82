# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="domutils"
inherit npm

DESCRIPTION="Utilities for working with htmlparser2's DOM"
HOMEPAGE="https://github.com/fb55/domelementtype"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/dom-serializer
        dev-nodejs/domelementtype
        dev-nodejs/domhandler
"
