# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vscode-languageserver-protocol"
inherit npm

DESCRIPTION="This npm module is a tool independent implementation of the language server protocol and can be used in any type of node application"
HOMEPAGE="https://github.com/Microsoft/vscode-languageserver-node"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vscode-languageserver-types
        dev-nodejs/vscode-jsonrpc
"
