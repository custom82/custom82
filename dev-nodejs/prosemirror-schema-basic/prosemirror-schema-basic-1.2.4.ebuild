# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="prosemirror-schema-basic"
inherit npm

DESCRIPTION="This is a schema module for ProseMirror"
HOMEPAGE="https://github.com/prosemirror/prosemirror-schema-basic"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/prosemirror-model
"
