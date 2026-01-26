# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="langium"
inherit npm

DESCRIPTION="Langium is a language engineering tool with built-in support for the Language Server Protocol"
HOMEPAGE="https://github.com/eclipse-langium/langium"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/chevrotain
        dev-nodejs/chevrotain-allstar
        dev-nodejs/vscode-languageserver
        dev-nodejs/vscode-languageserver-textdocument
        dev-nodejs/vscode-uri
"
