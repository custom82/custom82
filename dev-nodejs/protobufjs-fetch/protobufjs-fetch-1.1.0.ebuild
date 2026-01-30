# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@protobufjs/fetch"
inherit npm

DESCRIPTION="Fetches the contents of a file accross node and browsers"
HOMEPAGE="https://github.com/dcodeIO/protobuf.js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/protobufjs-aspromise
        dev-nodejs/protobufjs-inquire
"

