# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="codemirror-lang-elixir"
inherit npm

DESCRIPTION="This package implements Elixir language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/livebook-dev/codemirror-lang-elixir"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/codemirror-language
        dev-nodejs/lezer-elixir
"
