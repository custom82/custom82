# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="vscode-languageserver"
inherit npm

DESCRIPTION="Npm module to implement a VSCode language server using Node.js as a runtime"
HOMEPAGE="https://github.com/Microsoft/vscode-languageserver-node"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vscode-languageserver-protocol
"
