# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="bl"
inherit npm

DESCRIPTION="A Node.js Buffer list collector, reader and streamer thingy"
HOMEPAGE="https://github.com/rvagg/bl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
         dev-nodejs/types-readable-stream
         dev-nodejs/buffer
         dev-nodejs/inherits
         dev-nodejs/readable-stream
"
