# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@eslint-community/eslint-utils"
inherit npm

DESCRIPTION="This package provides utility functions and classes for make ESLint custom rules"
HOMEPAGE="https://github.com/eslint-community/eslint-utils"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/eslint-visitor-keys
"
