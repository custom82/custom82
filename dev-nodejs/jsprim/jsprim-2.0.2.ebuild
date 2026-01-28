# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="jsprim"
inherit npm

DESCRIPTION="This library is a super small wrapper over node's assert module that has two things"
HOMEPAGE="https://github.com/mcavage/node-assert-plus"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/assert-plus
        dev-nodejs/extsprintf
        dev-nodejs/json-schema
        dev-nodejs/verror
"
