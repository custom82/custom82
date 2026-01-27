# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="prosemirror-example-setup"
inherit npm

DESCRIPTION="This is a non-core example module for ProseMirror"
HOMEPAGE="https://github.com/prosemirror/prosemirror-example-setup"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/prosemirror-commands
        dev-nodejs/prosemirror-dropcursor
        dev-nodejs/prosemirror-gapcursor
        dev-nodejs/prosemirror-history
        dev-nodejs/prosemirror-inputrules
        dev-nodejs/prosemirror-keymap
        dev-nodejs/prosemirror-menu
        dev-nodejs/prosemirror-schema-list
        dev-nodejs/prosemirror-state
"
