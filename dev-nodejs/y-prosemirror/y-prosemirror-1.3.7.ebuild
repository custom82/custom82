# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="y-prosemirror"
inherit npm

DESCRIPTION="ProseMirror Binding for Yjs"
HOMEPAGE="https://github.com/yjs/y-prosemirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/lib0
"
