# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="side-channel-weakmap"
inherit npm

DESCRIPTION="Store information about any JS value in a side channel"
HOMEPAGE="https://github.com/ljharb/side-channel-weakmap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/call-bound
        dev-nodejs/es-errors
        dev-nodejs/get-intrinsic
        dev-nodejs/object-inspect
        dev-nodejs/side-channel-map

"
