# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="codemirror"
inherit npm

DESCRIPTION="This package provides an example configuration for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/basic-setup"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/codemirror-autocomplete
        dev-nodejs/codemirror-commands
        dev-nodejs/codemirror-language
        dev-nodejs/codemirror-lint
        dev-nodejs/codemirror-search
        dev-nodejs/codemirror-state
        dev-nodejs/codemirror-view
"
