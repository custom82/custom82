# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="is-fullwidth-code-point"
inherit npm

DESCRIPTION="Check if the character represented by a given Unicode code point is fullwidth"
HOMEPAGE="https://github.com/sindresorhus/is-fullwidth-code-point"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/get-east-asian-width
"
