# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="to-through"
inherit npm

DESCRIPTION="Wrap a Readable stream in a Transform stream"
HOMEPAGE="https://github.com/gulpjs/to-through"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/streamx
"
