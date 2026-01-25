# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="prosemirror-tables"
inherit npm

DESCRIPTION="This module defines a schema extension to support tables with rowspan/colspan support"
HOMEPAGE="https://github.com/ProseMirror/prosemirror-tables"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/prosemirror-keymap
        dev-nodejs/prosemirror-model
        dev-nodejs/prosemirror-state
        dev-nodejs/prosemirror-transform
        dev-nodejs/prosemirror-view
"
