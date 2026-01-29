# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="levn"
inherit npm

DESCRIPTION="Light ECMAScript Value Notation Levn is a library which allows you to parse a string into a JavaScript value based on an expected type"
HOMEPAGE="https://github.com/gkz/levn"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/prelude-ls
        dev-nodejs/type-check
"
