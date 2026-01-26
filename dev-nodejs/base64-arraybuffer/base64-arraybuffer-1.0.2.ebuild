# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="base64-arraybuffer"
inherit npm

DESCRIPTION="Encode/decode base64 data into ArrayBuffers"
HOMEPAGE="https://github.com/niklasvh/base64-arraybuffer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/base64-arraybuffer
"
