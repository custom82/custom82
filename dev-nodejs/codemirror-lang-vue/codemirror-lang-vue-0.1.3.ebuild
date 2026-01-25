# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@codemirror/lang-vue"
inherit npm

DESCRIPTION="This package implements Vue template support for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/lang-vue"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-lang-html
        dev-nodejs/codemirror-lang-javascript
        dev-nodejs/codemirror-language
        dev-nodejs/lezer-common
        dev-nodejs/lezer-highlight
        dev-nodejs/lezer-lr
"
