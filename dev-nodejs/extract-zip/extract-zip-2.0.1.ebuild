# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="extract-zip"
inherit npm

DESCRIPTION="Unzip written in pure JavaScript"
HOMEPAGE="https://github.com/maxogden/extract-zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-yauzl
        dev-nodejs/debug
        dev-nodejs/get-stream
        dev-nodejs/yauzl
"
