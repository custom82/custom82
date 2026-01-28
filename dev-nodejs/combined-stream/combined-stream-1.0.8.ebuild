# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="combined-stream"
inherit npm

DESCRIPTION="A stream that emits multiple other streams one after another"
HOMEPAGE="https://github.com/felixge/node-combined-stream"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/delayed-stream
"
