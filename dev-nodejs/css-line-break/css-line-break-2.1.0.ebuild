# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="css-line-break"
inherit npm

DESCRIPTION="A JavaScript library for Line Breaking and identifying Word Boundaries"
HOMEPAGE="https://github.com/niklasvh/css-line-break"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/utrie
"
