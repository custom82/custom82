# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="through2"
inherit npm

DESCRIPTION="A tiny wrapper around Node.js streams.Transform (Streams2/3) to avoid explicit subclassing noise"
HOMEPAGE="https://github.com/rvagg/through2"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/readable-stream
"
