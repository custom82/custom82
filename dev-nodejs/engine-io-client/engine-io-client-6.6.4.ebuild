# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="engine.io-client"
inherit npm

DESCRIPTION="This is the client for Engine.IO, the implementation of transport-based cross-browser/cross-device bi-directional communication layer for Socket.IO"
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
