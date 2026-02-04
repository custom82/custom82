# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="jsdom"
inherit npm

DESCRIPTION="jsdom is a pure-JavaScript implementation of many web standards, notably the WHATWG DOM and HTML Standards, for use with Node.js"
HOMEPAGE="https://github.com/jsdom/jsdom"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/acemir-cssom
        dev-nodejs/asamuzakjp-dom-selector
        dev-nodejs/exodus-bytes
        dev-nodejs/cssstyle
        dev-nodejs/data-urls
        dev-nodejs/decimal-js
        dev-nodejs/html-encoding-sniffer
        dev-nodejs/http-proxy-agent
        dev-nodejs/https-proxy-agent
        dev-nodejs/is-potential-custom-element-name
        dev-nodejs/parse5
        dev-nodejs/saxes
        dev-nodejs/symbol-tree
        dev-nodejs/tough-cookie
        dev-nodejs/undici
        dev-nodejs/w3c-xmlserializer
        dev-nodejs/webidl-conversions
        dev-nodejs/whatwg-mimetype
        dev-nodejs/whatwg-url
        dev-nodejs/xml-name-validator
"
