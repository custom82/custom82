# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="readable-stream"
inherit npm

DESCRIPTION="This package is a mirror of the streams implementations in Node.js"
HOMEPAGE="https://github.com/nodejs/readable-stream"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/abort-controller
        dev-nodejs/buffer
        dev-nodejs/events
        dev-nodejs/process
        dev-nodejs/string_decoder
"
