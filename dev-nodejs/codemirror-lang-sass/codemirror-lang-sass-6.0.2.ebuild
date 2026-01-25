# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@codemirror/lang-sass"
inherit npm

DESCRIPTION="This package implements Sass/SCSS language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/lang-sass"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-lang-css
        dev-nodejs/codemirror-language
        dev-nodejs/codemirror-state
        dev-nodejs/lezer-common
        dev-nodejs/lezer-sass
"
