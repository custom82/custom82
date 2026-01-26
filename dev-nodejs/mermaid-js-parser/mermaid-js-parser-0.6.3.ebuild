# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@mermaid-js/parser"
inherit npm

DESCRIPTION="Mermaid Parser"
HOMEPAGE="https://github.com/mermaid-js/mermaid"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/langium
"
