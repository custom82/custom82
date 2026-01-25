# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@tiptap/pm"
inherit npm

DESCRIPTION="Tiptap is a headless wrapper around ProseMirror – a toolkit for building rich text WYSIWYG editors"
HOMEPAGE="https://github.com/ueberdosis/tiptap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/prosemirror-changeset
        dev-nodejs/prosemirror-collab
        dev-nodejs/prosemirror-commands
        dev-nodejs/prosemirror-dropcursor
        dev-nodejs/prosemirror-gapcursor
        dev-nodejs/prosemirror-history
        dev-nodejs/prosemirror-inputrules
        dev-nodejs/prosemirror-keymap
        dev-nodejs/prosemirror-markdown
        dev-nodejs/prosemirror-menu
        dev-nodejs/prosemirror-model
        dev-nodejs/prosemirror-schema-basic
        dev-nodejs/prosemirror-schema-list
        dev-nodejs/prosemirror-state
        dev-nodejs/prosemirror-tables
        dev-nodejs/prosemirror-trailing-node
        dev-nodejs/prosemirror-transform
        dev-nodejs/prosemirror-view
"
