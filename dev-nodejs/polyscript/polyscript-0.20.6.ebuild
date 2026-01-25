# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="polyscript"
inherit npm

DESCRIPTION="PyScript single core to rule them all"
HOMEPAGE="https://www.npmjs.com/package/polyscript"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/webreflection-fetch
        dev-nodejs/webreflection-idb-map
        dev-nodejs/webreflection-utils
        dev-nodejs/basic-devtools
        dev-ndoejs/codedent
        dev-nodejs/coincident
        dev-nodejs/html-escaper
        dev-nodejs/reflected-ffi
        dev-nodejs/sticky-module
        dev-nodejs/to-json-callback
"



NPM_EXTRA_FILES="esm dist types versions"
