# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="cfb"
inherit npm

DESCRIPTION="Pure JS implementation of various container file formats, including ZIP and CFB"
HOMEPAGE="https://github.com/SheetJS/js-cfb"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/adler_32
        dev-nodejs/crc_32
"
