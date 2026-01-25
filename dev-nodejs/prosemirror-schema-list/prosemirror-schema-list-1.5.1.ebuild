# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="prosemirror-schema-list"
inherit npm

DESCRIPTION="This is a schema module for ProseMirror"
HOMEPAGE="https://github.com/prosemirror/prosemirror-schema-list"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/prosemirror-model
        dev-nodejs/prosemirror-state
        dev-nodejs/prosemirror-transform
"
