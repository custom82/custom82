# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="roughjs"
inherit npm

DESCRIPTION="Rough.js is a small (<9 kB) graphics library that lets you draw in a sketchy, hand-drawn-like, style"
HOMEPAGE="https://github.com/pshihn/rough"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/hachure-fill
        dev-nodejs/path-data-parser
        dev-nodejs/points-on-curve
        dev-nodejs/points-on-path
"
