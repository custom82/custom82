# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="parse5"
inherit npm

DESCRIPTION="HTML parser and serializer"
HOMEPAGE="https://github.com/inikulin/parse5"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/entities
"
