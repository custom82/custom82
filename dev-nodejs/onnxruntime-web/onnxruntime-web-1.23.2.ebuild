# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="onnxruntime-web"
inherit npm

DESCRIPTION="This package implements WebAssembly Text Format language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/microsoft/onnxruntime"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/flatbuffers
        dev-nodejs/guid-typescript
        dev-nodejs/long
        dev-nodejs/onnxruntime-common
        dev-nodejs/platform
        dev-nodejs/protobufjs
"
