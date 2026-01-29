# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="eslint-scope"
inherit npm

DESCRIPTION="ESLint Scope is the ECMAScript scope analyzer used in ESLint. It is a fork of escope"
HOMEPAGE="https://github.com/eslint/js"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-esrecurse
        dev-nodejs/types-estree
        dev-nodejs/esrecurse
        dev-nodejs/estraverse
"
