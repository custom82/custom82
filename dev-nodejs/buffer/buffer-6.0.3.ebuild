# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="buffer"
inherit npm

DESCRIPTION="With browserify, simply require('buffer') or use the Buffer global and you will get this module"
HOMEPAGE="https://github.com/feross/buffer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/ieee754
        dev-nodejs/base64-js
"
