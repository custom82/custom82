# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="data-urls"
inherit npm

DESCRIPTION="This package helps you parse data"
HOMEPAGE="https://github.com/jsdom/data-urls"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/whatwg-mimetype
        dev-nodejs/whatwg-url
"
