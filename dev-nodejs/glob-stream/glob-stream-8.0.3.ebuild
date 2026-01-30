# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="glob-stream"
inherit npm

DESCRIPTION="Readable streamx interface over anymatch"
HOMEPAGE="https://github.com/gulpjs/glob-stream"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/gulpjs-to-absolute-glob
        dev-nodejs/anymatch
        dev-nodejs/fastq
        dev-nodejs/glob-parent
        dev-nodejs/is-glob
        dev-nodejs/is-negated-glob
        dev-nodejs/normalize-path
        dev-nodejs/streamx
"
