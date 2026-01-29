# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cheerio"
inherit npm

DESCRIPTION="The fast, flexible, and elegant library for parsing and manipulating HTML and XML"
HOMEPAGE="https://github.com/cheeriojs/cheerio"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cheerio-select
        dev-nodejs/dom-serializer
        dev-nodejs/domhandler
        dev-nodejs/domutils
        dev-nodejs/encoding-sniffer
        dev-nodejs/htmlparser2
        dev-nodejs/parse5
        dev-nodejs/parse5-htmlparser2-tree-adapter
        dev-nodejs/parse5-parser-stream
        dev-nodejs/undici
        dev-nodejs/whatwg-mimetype
"
