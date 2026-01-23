# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This package implements the editor state data structures for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/state"
SRC_URI="https://github.com/codemirror/state/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-nodejs/find-cluster-break"

BDEPEND="dev-nodejs/buildhelper"

NPM_EXTRA_FILES="src"

npm_src_unpack() {
    unpack "${A}"
}
