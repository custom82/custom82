# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="w3c-xmlserializer"
inherit npm

DESCRIPTION="An XML serializer that follows the W3C specification"
HOMEPAGE="https://github.com/jsdom/w3c-xmlserializer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/xml-name-validator
"
