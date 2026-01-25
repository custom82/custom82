# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@codemirror/lang-markdown"
inherit npm

DESCRIPTION="This package implements Markdown language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/lang-markdown"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-autocomplete
        dev-nodejs/codemirror-lang-html
        dev-nodejs/codemirror-language
        dev-nodejs/codemirror-state
        dev-nodejs/codemirror-view
        dev-nodejs/lezer-common
        dev-nodejs/lezer-markdown
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"


