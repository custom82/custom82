# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="i18next"
inherit npm

DESCRIPTION="i18next is a very popular internationalization framework for browser or any other javascript environment"
HOMEPAGE="https://github.com/i18next/i18next"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/babel-runtime
"
