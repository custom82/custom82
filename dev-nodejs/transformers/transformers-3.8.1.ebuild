# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Run 🤗 Transformers directly in your browser, with no need for a server!"
HOMEPAGE="https://github.com/huggingface/transformers.js"
SRC_URI="https://github.com/huggingface/transformers.js/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="jest.config.mjs scripts src webpack.config.js"

RDEPEND="
        dev-nodejs/jinja
        dev-nodejs/onnxruntime-nodejs
        dev-nodejs/onnxruntime-web
        dev-nodejs/sharp
"

BDEPEND="
        dev-nodejs/jest
        dev-nodejs/node
        dev-nodejs/types
        dev-nodejs/jest-environmente-node
        dev-nodejs/jsdoc-to-markdown
        dev-nodejs/prettier
        dev-nodejs/typescript
        dev-nodejs/wavefile
        dev-nodejs/webapck
        dev-nodejs/webpack-cli
        dev-nodejs/webpack-dev-server
"

npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/transformers.js-${PV} "${S}"
}
