# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="fs-extra"
inherit npm

DESCRIPTION="fs-extra adds file system methods that aren't included in the native fs module and adds promise support to the fs methods"
HOMEPAGE="https://github.com/andrewrk/node-pend"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/graceful-fs
        dev-nodejs/jsonfile
        dev-nodejs/universalify
"
