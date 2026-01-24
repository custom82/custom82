# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements WebAssembly Text Format language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/microsoft/onnxruntime"
SRC_URI="https://github.com/microsoft/onnxruntime/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"



BDEPEND="
        dev-nodejs/typedoc
"

NPM_MODULE="onnxruntime-common"

NPM_EXTRA_FILES="webpack.config.js typedoc.json tsconfig.json build.js lib"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/onnxruntime-1.23.2/js/common ${S}
    rm -r "${WORKDIR}"/onnxruntime-${PV}
}

