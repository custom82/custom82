# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Simple, flexible, fun JavaScript test framework for Node.js & The Browser"
HOMEPAGE="https://github.com/mochajs/mocha"
SRC_URI="https://github.com/mochajs/mocha/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="src bin"

RDEPEND="
        dev-nodejs/browser-stdout
        dev-nodejs/chokidar
        dev-nodejs/debug
        dev-nodejs/diff
        dev-nodejs/escape-string-regexp
        dev-nodejs/find-up
        dev-nodejs/glob
        dev-nodejs/he
        dev-nodejs/is-path-inside
        dev-nodejs/js-yaml
        dev-nodejs/log-symbols
        dev-nodejs/minimatch
        dev-nodejs/ms
        dev-nodejs/picocolors
        dev-nodejs/serialize-javascript
        dev-nodejs/strip-json-comments
        dev-nodejs/supports-color
        dev-nodejs/workerpool
        dev-nodejs/yargs
        dev-nodejs/yargs-parser
        dev-nodejs/yargs-unparser
"

BDEPEND="
        dev-nodejs/eleventy
        dev-nodejs/eleventy-plugin-inclusive-language
        dev-nodejs/js
        dev-nodejs/docdash
        dev-nodejs/plugin-alias
        dev-nodejs/plugin-alias
        dev-nodejs/plugin-commonjs
        dev-nodejs/plugin-json
        dev-nodejs/plugin-multi-entry
        dev-nodejs/plugin-node-resolve
        dev-nodejs/node
        dev-nodejs/yargs
        dev-nodejs/chai
        dev-nodejs/coffeescript
        dev-nodejs/cross-env
        dev-nodejs/eslint
        dev-nodejs/eslint-plugin-n
        dev-nodejs/fail-on-errors-webpack-plugin
        dev-nodejs/globals
        dev-nodejs/http-server
        dev-nodejs/installed-check
        dev-nodejs/jsdoc
        dev-nodejs/jsdoc-ts-utils
        dev-nodejs/karma
        dev-nodejs/karma-chrome-launcher
        dev-nodejs/karma-mocha
        dev-nodejs/karma-mocha-reporter
        dev-nodejs/karma-sauce-launcher
        dev-nodejs/knip
        dev-nodejs/markdown-it
        dev-nodejs/markdown-it-anchor
        dev-nodejs/markdown-it-attrs
        dev-nodejs/markdown-it-emoji
        dev-nodejs/markdown-it-prism
        dev-nodejs/markdown-toc
        dev-nodejs/markdownlint-cli
        dev-nodejs/needle
        dev-nodejs/npm-run-all2
        dev-nodejs/nyc
        dev-nodejs/pidtree
        dev-nodejs/prettier
        dev-nodejs/remark
        dev-nodejs/remark-github
        dev-nodejs/remark-inline-links
        dev-nodejs/rewiremock
        dev-nodejs/rimraf
        dev-nodejs/rollup
        dev-nodejs/rollup-plugin-node-globals
        dev-nodejs/rollup-plugin-polyfill-node
        dev-nodejs/rollup-plugin-visualizer
        dev-nodejs/semver
        dev-nodejs/sinon
        dev-nodejs/typescript
        dev-nodejs/unexpected
        dev-nodejs/unexpected-eventemitter
        dev-nodejs/unexpected-map
        dev-nodejs/unexpected-set
        dev-nodejs/unexpected-sinon
        dev-nodejs/uslug
        dev-nodejs/webpack
        dev-nodejs/webpack-cli
"

NPM_EXTRA_FILES="tsconfig.json scripts rollup.config.js netlify.toml mocha.css lib bin "


npm_src_unpack() {
    unpack "${A}"
}
