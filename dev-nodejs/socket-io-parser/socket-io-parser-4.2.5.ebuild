# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="socket.io-parser"
inherit npm

DESCRIPTION="A socket.io encoder and decoder written in JavaScript complying with version 5 of socket.io-protocol"
HOMEPAGE="https://github.com/socketio/socket.io"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/socket-io-component-emitter
        dev-nodejs/debug
"
