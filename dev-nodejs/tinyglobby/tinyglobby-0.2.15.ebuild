# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="tinyglobby"
inherit npm

DESCRIPTION="A fast and minimal alternative to globby and fast-glob, meant to behave the same way"
HOMEPAGE="https://github.com/SuperchupuDev/tinyglobby"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/fdir
        dev-nodejs/picomatch
"
