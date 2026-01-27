# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-dsv"
inherit npm

DESCRIPTION="This module provides a parser and formatter for delimiter-separated values"
HOMEPAGE="https://github.com/d3/d3-dsv"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/commander
        dev-nodejs/iconv-lite
        dev-nodejs/rw
"
