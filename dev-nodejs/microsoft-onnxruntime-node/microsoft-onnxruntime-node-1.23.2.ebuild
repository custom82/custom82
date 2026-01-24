# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="onnxruntime-node"
inherit npm


DESCRIPTION="This package implements WebAssembly Text Format language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/microsoft/onnxruntime"

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

NPM_EXTRA_FILES="dist bin"

npm_src_unpack () {
        unpack ${A}
        mv ${WORKDIR}/package "${S}"
}




