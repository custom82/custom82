# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="once"
inherit npm

DESCRIPTION="Only call a function once"
HOMEPAGE="https://github.com/isaacs/once"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/wrappy
"
