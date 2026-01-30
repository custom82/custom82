# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vinyl-fs"
inherit npm

DESCRIPTION="Vinyl adapter for the file system"
HOMEPAGE="https://github.com/gulpjs/vinyl-fs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/fs-mkdirp-stream
        dev-nodejs/glob-stream
        dev-nodejs/graceful-fs
        dev-nodejs/iconv-lite
        dev-nodejs/is-valid-glob
        dev-nodejs/lead
        dev-nodejs/normalize-path
        dev-nodejs/resolve-options
        dev-nodejs/stream-composer
        dev-nodejs/streamx
        dev-nodejs/to-through
        dev-nodejs/value-or-function
        dev-nodejs/vinyl
        dev-nodejs/vinyl-sourcemap
"
