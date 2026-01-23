# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This is a utility that transforms code documented with getdocs-style doc comments into HTML"
HOMEPAGE="https://github.com/markdown-it/markdown-it"
SRC_URI="https://github.com/markdown-it/markdown-it/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/argparse
        dev-nodejs/entities
        dev-nodejs/linkify-it
        dev-nodejs/mdurl
        dev-nodejs/punycode-js
        dev-nodejs/uc-micro
"

BDEPEND="
        dev-nodejs/plugin-babel
        dev-nodejs/plugin-commonjs
        dev-nodejs/plugin-node-resolve
        dev-nodejs/plugin-terser
        dev-nodejs/ansi
        dev-nodejs/benchmark
        dev-nodejs/c8
        dev-nodejs/chai
        dev-nodejs/eslint
        dev-nodejs/eslint-config-standard
        dev-nodejs/express
        dev-nodejs/gh-pages
        dev-nodejs/highlight-js
        dev-nodejs/jest-worker
        dev-nodejs/markdown-it-abbr
        dev-nodejs/markdown-it-container
        dev-nodejs/markdown-it-deflist
        dev-nodejs/markdown-it-emoji
        dev-nodejs/markdown-it-footnote
        dev-nodejs/markdown-it-for-inline
        dev-nodejs/markdown-it-ins
        dev-nodejs/markdown-it-mark
        dev-nodejs/markdown-it-sub
        dev-nodejs/markdown-it-sup
        dev-nodejs/markdown-it-testgen
        dev-nodejs/mocha
        dev-nodejs/ndoc
        dev-nodejs/needle
        dev-nodejs/rollup
        dev-nodejs/shelljs
        dev-nodejs/supertest
"

NPM_EXTRA_FILES="bin lib support index.mjs benchmark"

npm_src_unpack() {
    unpack "${A}"
}
