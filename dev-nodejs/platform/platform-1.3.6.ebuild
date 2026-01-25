# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="platform"
inherit npm

DESCRIPTION="A platform detection library that works on nearly all JavaScript platforms"
HOMEPAGE="https://github.com/bestiejs/platform.js"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="platform.js"
