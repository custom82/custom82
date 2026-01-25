# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@codemirror/state"
inherit npm

DESCRIPTION="This package implements the editor state data structures for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/state"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/marijn-find-cluster-break
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"

