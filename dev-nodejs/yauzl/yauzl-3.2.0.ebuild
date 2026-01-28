# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="yauzl"
inherit npm

DESCRIPTION="yet another unzip library for node. For zipping, see yazl"
HOMEPAGE="https://github.com/thejoshwolfe/yauzl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/buffer-crc32
        dev-nodejs/pend
"
