# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="prosemirror-trailing-node"
inherit npm

DESCRIPTION="This module defines a schema extension to support tables with rowspan/colspan support"
HOMEPAGE="https://github.com/remirror/remirror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/escape-string-regexp
        dev-nodejs/remirror-core-constants
"
