# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@codemirror/search"
inherit npm

DESCRIPTION="This package implements search functionality for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/search"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/codemirror-state
        dev-nodejs/codemirror-view
        dev-nodejs/crelt
"
