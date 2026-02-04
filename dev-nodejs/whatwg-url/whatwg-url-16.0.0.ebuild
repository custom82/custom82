# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="whatwg-url"
inherit npm

DESCRIPTION="whatwg-url is a full implementation of the WHATWG URL Standard"
HOMEPAGE="https://github.com/jsdom/whatwg-url"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/exodus-bytes
        dev-nodejs/tr46
        dev-nodejs/webidl-conversions
"
