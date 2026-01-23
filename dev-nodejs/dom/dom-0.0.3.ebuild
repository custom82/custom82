# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="DOM traversal / manipulation library"
HOMEPAGE="https://github.com/defunctzombie/dom"
SRC_URI="https://github.com/defunctzombie/dom/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="lib"

npm_src_unpack() {
    unpack "${A}"
}
