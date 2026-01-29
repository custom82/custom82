# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="encoding-sniffer"
inherit npm

DESCRIPTION="An implementation of the HTML encoding sniffer algo, with stream support"
HOMEPAGE="https://github.com/fb55/encoding-sniffer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/iconv-lite
        dev-nodejs/whatwg-encoding
"
