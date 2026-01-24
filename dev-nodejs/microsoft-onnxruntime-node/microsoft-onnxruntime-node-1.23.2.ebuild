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

RDEPEND="
        dev-nodejs/adm-zip
        dev-nodejs/global-agent
        dev-nodejs/microssoft-onnxruntime-common
        "

BDEPEND="
        dev-nodejs/types-minimist
        dev-nodejs/cmake-js
        dev-nodejs/jsonc
        dev-nodejs/minimist
        dev-nodejs/node-addon-api
        dev-nodejs/protobufjs
"

NPM_MODULE="onnxruntime-node"

NPM_EXTRA_FILES="tsconfig.json src script"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/onnxruntime-1.23.2/js/node ${S}
    rm -r "${WORKDIR}"/onnxruntime-${PV}
}

