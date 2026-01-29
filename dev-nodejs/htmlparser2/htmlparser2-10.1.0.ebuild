# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="htmlparser2"
inherit npm

DESCRIPTION="The fast & forgiving HTML/XML parser"
HOMEPAGE="https://github.com/fb55/htmlparser2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/domelementtype
        dev-nodejs/domhandler
        dev-nodejs/domutils
        dev-nodejs/entities
"
