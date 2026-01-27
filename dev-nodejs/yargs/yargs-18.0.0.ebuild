# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="yargs"
inherit npm

DESCRIPTION="Yargs be a node.js library fer hearties tryin' ter parse optstrings"
HOMEPAGE="https://github.com/yargs/yargs"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cliui
        dev-nodejs/escalade
        dev-nodejs/get-caller-file
        dev-nodejs/string-width
        dev-nodejs/y18n
        dev-nodejs/yargs-parser
"
