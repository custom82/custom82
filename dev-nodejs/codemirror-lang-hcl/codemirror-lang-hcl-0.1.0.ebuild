# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="codemirror-lang-hcl"
inherit npm

DESCRIPTION="This package implements HCL language support for the CodeMirror code editor"
HOMEPAGE="https://www.npmjs.com/package/codemirror-lang-hcl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/codemirror-language
        dev-nodejs/lezer-highlight
        dev-nodejs/lezer-lr
"
