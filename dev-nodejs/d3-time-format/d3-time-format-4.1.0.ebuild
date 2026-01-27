# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="d3-time-format"
inherit npm

DESCRIPTION="This module provides a JavaScript implementation of the venerable strptime and strftime functions from the C standard library"
HOMEPAGE="https://github.com/d3/d3-time-format"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/d3-time
"
