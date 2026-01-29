# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="type-check"
inherit npm

DESCRIPTION="type-check is a library which allows you to check the types of JavaScript values at runtime with a Haskell like type syntax"
HOMEPAGE="https://github.com/gkz/type-check"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/prelude-ls
"
