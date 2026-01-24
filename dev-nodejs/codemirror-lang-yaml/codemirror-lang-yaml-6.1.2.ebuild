# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This package implements YAML language support for the CodeMirror code editor"
HOMEPAGE="https://github.com/codemirror/lang-yaml"
SRC_URI="https://github.com/codemirror/lang-yaml/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/codemirror-autocomplete
        dev-nodejs/codemirror-language
        dev-nodejs/codemirror-state
        dev-nodejs/lezer-common
        dev-nodejs/lezer-highlight
        dev-nodejs/lezer-lr
        dev-nodejs/lezer-yaml
"

BDEPEND="
        dev-nodejs/codemirror-buildhelper
"

NPM_MODULE="@codemirror/lang-yaml"

NPM_EXTRA_FILES="src"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/lang-yaml-${PV} "${S}"
}

