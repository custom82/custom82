# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="http-signature"
inherit npm

DESCRIPTION="This module provides miscellaneous facilities for working with strings, numbers, dates, and objects and arrays of these basic types"
HOMEPAGE="https://github.com/joyent/node-jsprim"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/assert-plus
        dev-nodejs/extsprintf
        dev-nodejs/json-schema
        dev-nodejs/verror
"
