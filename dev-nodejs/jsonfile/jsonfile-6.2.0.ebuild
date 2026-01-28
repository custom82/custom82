# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="jsonfile"
inherit npm

DESCRIPTION="Easily read/write JSON files in Node.js. Note: this module cannot be used in the browser"
HOMEPAGE="https://github.com/jprichardson/node-jsonfile"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/universalify
"
