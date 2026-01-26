# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="jszip"
inherit npm

DESCRIPTION="A library for creating, reading and editing .zip files with JavaScript, with a lovely and simple API"
HOMEPAGE="https://github.com/Stuk/jszip"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/lie
        dev-nodejs/pako
        dev-nodejs/readable-stream
        dev-nodejs/setimmediate
"
