# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This package contains type definitions for node (https://nodejs.org/)."
HOMEPAGE="https://github.com/DefinitelyTyped/DefinitelyTyped"
SRC_URI="https://github.com/DefinitelyTyped/DefinitelyTyped/archive/refs/tags/0.1.450.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"


RDEPEND="dev-nodejs/undici-types"

NPM_EXTRA_FILES="*.ts scripts ts3.2 v0 v4 v6 v7 v8 v9 v10 v11"

npm_src_unpack() {
    unpack "${A}"
    if [ -d "${WORKDIR}"/DefinitelyTyped-0.1.450/types/node ] ; then
        mv "${WORKDIR}"/DefinitelyTyped-0.1.450/types/node "${S}"
        rm -r "${WORKDIR}"/DefinitelyTyped-0.1.450
    fi
}




