# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vinyl-sourcemap"
inherit npm

DESCRIPTION="Add/write sourcemaps to/from Vinyl files"
HOMEPAGE="https://github.com/gulpjs/vinyl-sourcemap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/convert-source-map
        dev-nodejs/graceful-fs
        dev-nodejs/now-and-later
        dev-nodejs/streamx
        dev-nodejs/vinyl
        dev-nodejs/vinyl-contents
"
