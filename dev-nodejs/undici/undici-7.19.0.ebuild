# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This package is a dual-publish of the undici library types"
HOMEPAGE="https://github.com/nodejs/undici"
SRC_URI="https://github.com/nodejs/undici/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"


NPM_EXTRA_FILES="lib scripts types"

npm_src_unpack() {
    unpack "${A}"
}
