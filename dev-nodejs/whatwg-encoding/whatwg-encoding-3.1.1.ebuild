# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="whatwg-encoding"
inherit npm

DESCRIPTION="Decode According to the WHATWG Encoding Standard"
HOMEPAGE="https://github.com/jsdom/whatwg-encoding"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/iconv-lite
"
