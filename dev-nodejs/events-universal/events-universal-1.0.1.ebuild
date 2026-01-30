# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="events-universal"
inherit npm

DESCRIPTION="An iteration of the Node.js core streams with a series of improvements"
HOMEPAGE="https://github.com/mafintosh/fast-fifo"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/bare-events
"
