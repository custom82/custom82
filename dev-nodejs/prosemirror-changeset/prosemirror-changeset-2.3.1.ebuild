# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="prosemirror-changeset"
inherit npm

DESCRIPTION="This is a helper module that can turn a sequence of document changes into a set of insertions and deletions"
HOMEPAGE="https://github.com/prosemirror/prosemirror-changeset"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/prosemirror-transform
"
