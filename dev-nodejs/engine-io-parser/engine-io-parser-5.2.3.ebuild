# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="engine.io-parser"
inherit npm

DESCRIPTION="This is the JavaScript parser for the engine.io protocol encoding, shared by both engine.io-client and engine.io"
HOMEPAGE="https://github.com/socketio/socket.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/socket-io-component-emitter
        dev-nodejs/debug
        dev-nodejs/engine-io-parser
        dev-nodejs/ws
        dev-nodejs/xmlhttprequest-ssl
"
