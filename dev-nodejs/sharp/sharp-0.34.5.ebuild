# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="sharp"
inherit npm

DESCRIPTION="The typical use case for this high speed Node-API module is to convert large images in common formats to smaller, web-friendly JPEG, PNG, WebP, GIF and AVIF images of varying dimensions"
HOMEPAGE="https://github.com/lovell/sharp"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"


RDEPEND="
        dev-nodejs/img-colour
        dev-nodejs/detect-libc
        dev-nodejs/semver
"

BDEPEND="
        dev-nodejs/biomejs-biome
        dev-nodejs/cpplint-cli
        dev-nodejs/emnapi-runtime
        dev-nodejs/img-sharp-libvips-dev
        dev-nodejs/img-sharp-libvips-dev-wasm32
        dev-nodejs/img-sharp-libvips-win32-arm64
        dev-nodejs/img-sharp-libvips-win32-ia32
        dev-nodejs/img-sharp-libvips-win32-x64
        dev-nodejs/types-node
        dev-nodejs/emnapi
        dev-nodejs/exif-reader
        dev-nodejs/extract-zip
        dev-nodejs/icc
        dev-nodejs/jsdoc-to-markdown
        dev-ndoejs/node-addon-api
        dev-nodejs/node-gyp
        dev-nodejs/tar-fs
        dev-nodejs/tsd
"

