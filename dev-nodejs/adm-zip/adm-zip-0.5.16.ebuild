# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="ADM-ZIP is a pure JavaScript implementation for zip data compression for NodeJS"
HOMEPAGE="https://github.com/cthackers/adm-zip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="

"

BDEPEND="
"

NPM_MODULE="adm-zip"
NPM_EXTRA_FILES=""

npm_src_unpack() {
    unpack "${A}"
}
