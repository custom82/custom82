# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="xlsx"
inherit npm

DESCRIPTION="The SheetJS Community Edition offers battle-tested open-source solutions for extracting useful data from almost any complex spreadsheet and generating new spreadsheets that will work with legacy and modern software alike"
HOMEPAGE="https://github.com/SheetJS/sheetjs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/adler_32
        dev-nodejs/cfb
        dev-nodejs/codepage
        dev-nodejs/crc_32
        dev-nodejs/ssf
        dev-nodejs/wmf
        dev-nodejs/word
"
