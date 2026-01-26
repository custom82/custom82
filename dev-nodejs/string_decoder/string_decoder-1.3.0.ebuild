# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="string_decoder"
inherit npm

DESCRIPTION="This package is a mirror of the string_decoder implementation in Node-core"
HOMEPAGE="https://github.com/nodejs/string_decoder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/safe-buffer
"
