# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="saxes"
inherit npm

DESCRIPTION="A sax-style non-validating parser for XML"
HOMEPAGE="https://github.com/lddubeau/saxes"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/xmlchars
"
