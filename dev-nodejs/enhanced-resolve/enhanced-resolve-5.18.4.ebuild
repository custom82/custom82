# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="enhanced-resolve"
inherit npm

DESCRIPTION="Offers an async require.resolve function. It's highly configurable"
HOMEPAGE="https://github.com/webpack/enhanced-resolve"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/graceful-fs
        dev-nodejs/tapable
"
