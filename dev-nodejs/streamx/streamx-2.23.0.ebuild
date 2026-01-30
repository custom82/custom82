# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="streamx"
inherit npm

DESCRIPTION="An iteration of the Node.js core streams with a series of improvements"
HOMEPAGE="https://github.com/mafintosh/streamx"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/events-universal
        dev-nodejs/fast-fifo
        dev-nodejs/text-decoder
"
