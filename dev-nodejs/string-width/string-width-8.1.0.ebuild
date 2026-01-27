# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="string-width"
inherit npm

DESCRIPTION="Get the visual width of a string - the number of columns required to display it"
HOMEPAGE="https://github.com/sindresorhus/string-width"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/get-east-asian-width
        dev-nodejs/strip-ansi

"
