# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@codemirror/lang-css"
inherit npm

DESCRIPTION="This is a C++ grammar for the Lezer parser system."
HOMEPAGE="https://github.com/codemirror/lang-css"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-autocomplete
        dev-nodejs/codemirror-language
        dev-nodejs/codemirror-state
        dev-nodejs/lezer-common
        dev-nodejs/lezer-css
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"

