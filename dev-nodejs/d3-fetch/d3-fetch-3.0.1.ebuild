# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-fetch"
inherit npm

DESCRIPTION="This module provides convenient parsing on top of Fetch"
HOMEPAGE="https://github.com/d3/d3-fetch"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-dsv
"
