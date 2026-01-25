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

NPM_EXTRA_FILES=" index.js index.d.ts light.d.ts light.js minimal.d.ts minimal.js package-lock.json tsconfig.json scripts/postinstall.js dist ext google src"
