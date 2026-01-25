# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@protobufjs/inquire"
inherit npm

DESCRIPTION="Requires a module only if available and hides the require call from bundlers"
HOMEPAGE="https://github.com/dcodeIO/protobuf.js"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="index.js index.d.ts"
