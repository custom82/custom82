# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Lezer is an incremental parser system intended for use in an editor or similar system"
HOMEPAGE="https://github.com/lezer-parser/common"
SRC_URI="https://github.com/lezer-parser/common/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="tsconfig.json src"

npm_src_unpack() {
    unpack "${A}"
}
