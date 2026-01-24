# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@azure/msal-browser"
inherit npm

DESCRIPTION="Microsoft Authentication Library for JavaScript (MSAL.js) for Browser-Based Single-Page Applications"
HOMEPAGE="https://github.com/AzureAD/microsoft-authentication-library-for-js"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/azure-msal-common
"

BDEPEND="
        dev-nodejs/azure-storage-blob
        dev-nodejs/babel-plugin-proposal-class-properties
        dev-nodejs/babel-plugin-proposal-object-rest-spread
        dev-nodejs/babel-preset-typescript
        dev-nodejs/babel-core
        dev-nodejs/babel-preset-env
        dev-nodejs/microsoft-api-extractor
        dev-nodejs/rollup-plugin-node-resolve
        dev-nodejs/rollup-plugin-terser
        dev-nodejs/rollup-plugin-typescript
        dev-nodejs/types-jest
        dev-nodejs/types-node
        dev-nodejs/cross-env
        dev-nodejs/dotenv
        dev-nodejs/fake-indexeddb
        dev-nodejs/jest
        dev-nodejs/jest-environment-jsdom
        dev-nodejs/jest-junit
        dev-nodejs/prettier
        dev-nodejs/rimraf
        dev-nodejs/rollup
        dev-nodejs/shx
        dev-nodejs/ssri
        dev-nodejs/ts-jest
        dev-nodejs/ts-jest-resolver
        dev-nodejs/tslib
        dev-nodejs/typescript
"



NPM_EXTRA_FILES="dist"




npm_src_unpack () {
        unpack ${A}
        mv ${WORKDIR}/package "${S}"
}

