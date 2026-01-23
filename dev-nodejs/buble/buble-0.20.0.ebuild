# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Bublé was created when ES2015 was still the future"
HOMEPAGE="https://github.com/bublejs/buble"
SRC_URI="https://github.com/bublejs/buble/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/acorn
        dev-nodejs/acorn-dynamic-import
        dev-nodejs/acorn-jsx
        dev-nodejs/chalk
        dev-nodejs/magic-string
        dev-nodejs/minimist
        dev-nodejs/regexpu-core
"

BDEPEND="
        dev-nodejs/plugin-buble
        dev-nodejs/plugin-commonjs
        dev-nodejs/plugin-json
        dev-nodejs/plugin-node-resolve
        dev-nodejs/console-group
        dev-nodejs/eslint
        dev-nodejs/glob
        dev-nodejs/mocha
        dev-nodejs/rimraf
        dev-nodejs/rollup
        dev-nodejs/source-map
        dev-nodejs/source-map-support
        dev-nodejs/test-262-stream
"

NPM_EXTRA_FILES="src scripts bin rollup.create-config.js rollup.config.js register.js appveyor.yml"

npm_src_unpack() {
    unpack "${A}"
}
