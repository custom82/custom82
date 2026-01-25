# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@protobufjs/base64"
inherit npm

DESCRIPTION="A minimal base64 implementation for number arrays"
HOMEPAGE="https://github.com/dcodeIO/protobuf.js"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="index.js index.d.ts"
