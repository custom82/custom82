# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="protobufjs"
inherit npm

DESCRIPTION="Protocol Buffers are a language-neutral, platform-neutral, extensible way of serializing structured data for use in communications protocols, data storage, and more, originally designed at Google"
HOMEPAGE="https://github.com/protobufjs/protobuf.js"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/protobufjs-aspromise
        dev-nodejs/protobufjs-base64
        dev-nodejs/protobufjs-codegen
        dev-nodejs/protobufjs-eventemitter
        dev-nodejs/protobufjs-fetch
        dev-nodejs/protobufjs-float
        dev-nodejs/protobufjs-inquire
        dev-nodejs/protobufjs-path
        dev-nodejs/protobufjs-pool
        dev-nodejs/protobufjs-utf8
        dev-nodejs/types-node
        dev-nodejs/long
"

NPM_EXTRA_FILES=" index.js index.d.ts light.d.ts light.js minimal.d.ts minimal.js package-lock.json tsconfig.json scripts/postinstall.js dist ext google src"
