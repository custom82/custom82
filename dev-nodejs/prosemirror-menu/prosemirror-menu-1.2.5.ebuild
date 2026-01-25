# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="prosemirror-menu"
inherit npm

DESCRIPTION="This is a non-core example module for ProseMirror"
HOMEPAGE="https://github.com/prosemirror/prosemirror-menu"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/crelt
        dev-nodejs/prosemirror-commands
        dev-nodejs/prosemirror-history
        dev-nodejs/prosemirror-state
"
