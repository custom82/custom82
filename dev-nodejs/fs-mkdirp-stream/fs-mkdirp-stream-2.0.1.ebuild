# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="fs-mkdirp-stream"
inherit npm

DESCRIPTION="Ensure directories exist before writing to them"
HOMEPAGE="https://github.com/gulpjs/fs-mkdirp-stream"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/graceful-fs
        dev-nodejs/streamx
"
