# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="prosemirror-gapcursor"
inherit npm

DESCRIPTION="This is a core module of ProseMirror. ProseMirror is a well-behaved rich semantic content editor based on contentEditable"
HOMEPAGE="https://github.com/prosemirror/prosemirror-gapcursor"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/prosemirror-keymap
        dev-nodejs/prosemirror-model
        dev-nodejs/prosemirror-state
        dev-nodejs/prosemirror-view
"
