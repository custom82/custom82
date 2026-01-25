# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@protobufjs/aspromise"
inherit npm

DESCRIPTION="Returns a promise from a node-style callback function"
HOMEPAGE="https://github.com/dcodeIO/protobuf.js"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"


NPM_EXTRA_FILES="index.d.ts index.js "
