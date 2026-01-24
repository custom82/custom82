# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="Guid Typescript is library that let you generate guid code"
HOMEPAGE="https://github.com/snico-dev/guid-typescript"
SRC_URI="https://registry.npmjs.org/${NPM_MODULE}/-/${NPM_MODULE}-${PV}.tgz -> ${P}.tgz"



LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="

"

BDEPEND="
"

NPM_MODULE="guid-typescript"
NPM_EXTRA_FILES="zipFile.js zipEntry.js adm-zip.js .prettierrc.json .prettierignore .mocharc.yml util methods headers"

npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}/guid-typescript-95f2a1793a5d5d4938c5764e6d5b8dd462d4f761" ${S}
}

npm_src_compile() {
    npm run compile
}


