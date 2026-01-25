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
        dev-nodejs/microsoft-onnxruntime-common
        dev-nodejs/platform
        dev-nodejs/protobufjs"

BDEPEND="
        dev-nodejs/chiragrupani-karma-chromium-edge-launcher
        dev-nodejs/petamoriken-float16
        dev-nodejs/types-chai
        dev-nodejs/types-emscripten
        dev-nodejs/types-karma
        dev-nodejs/types-minimatch
        dev-nodejs/types-minimist
        dev-nodejs/types-platform
        dev-nodejs/webgpu-types
        dev-nodejs/base64-js
        dev-nodejs/chai
        dev-nodejs/electron
        dev-nodejs/globby
        dev-nodejs/karma
        dev-nodejs/karma-browserstack-launcher
        dev-nodejs/karma-chai
        dev-nodejs/karma-chrome-launcher
        dev-nodejs/karma-edge-launcher
        dev-nodejs/karma-electron
        dev-nodejs/karma-firefox-launcher
        dev-nodejs/karma-mocha
        dev-nodejs/karma-mocha-reporter
        dev-nodejs/karma-safari-applescript-launcher
        dev-nodejs/karma-sourcemap-loader
        dev-nodejs/minimatch
        dev-nodejs/minimist
        dev-nodejs/numpy-parser
        dev-nodejs/source-map
        dev-nodejs/strip-json-comments
"
