# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@codemirror/language"
inherit npm

DESCRIPTION="This package implements the language support infrastructure for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/language"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-state
        dec-nodejs/codemirror-view
        dev-nodejs/lezer-common
        dev-nodejs/lezer-highlight
        dev-nodejs/lezer-lr
        dev-nodejs/style-mod
"
