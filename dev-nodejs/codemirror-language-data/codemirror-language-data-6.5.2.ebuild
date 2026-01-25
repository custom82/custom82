# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@codemirror/language-data"
inherit npm

DESCRIPTION="This package implements Python language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/language-data"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-lang-angular
        dev-nodejs/codemirror-lang-cpp
        dev-nodejs/codemirror-lang-css
        dev-nodejs/codemirror-lang-go
        dev-nodejs/codemirror-lang-html
        dev-nodejs/codemirror-lang-java
        dev-nodejs/codemirror-lang-javascript
        dev-nodejs/codemirror-lang-jinja
        dev-nodejs/codemirror-lang-json
        dev-nodejs/codemirror-lang-less
        dev-nodejs/codemirror-lang-liquid
        dev-nodejs/codemirror-lang-markdown
        dev-nodejs/codemirror-lang-php
        dev-nodejs/codemirror-lang-python
        dev-nodejs/codemirror-lang-rust
        dev-nodejs/codemirror-lang-sass
        dev-nodejs/codemirror-lang-sql
        dev-nodejs/codemirror-lang-vue
        dev-nodejs/codemirror-lang-wast
        dev-nodejs/codemirror-lang-xml
        dev-nodejs/codemirror-lang-yaml
        dev-nodejs/codemirror-language
        dev-nodejs/codemirror-legacy-modes
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"



