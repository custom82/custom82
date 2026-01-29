# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="dom-serializer"
inherit npm

DESCRIPTION="Renders a domhandler DOM node or an array of domhandler DOM nodes to a string"
HOMEPAGE="https://github.com/cheeriojs/dom-serializer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/domelementtype
        dev-nodejs/domhandler
        dev-nodejs/entities
"
