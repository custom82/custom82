# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-array"
inherit npm

DESCRIPTION="Data in JavaScript is often represented by an iterable"
HOMEPAGE="https://github.com/d3/d3-array"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/internmap
"
