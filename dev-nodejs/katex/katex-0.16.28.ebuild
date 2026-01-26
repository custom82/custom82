# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="katex"
inherit npm

DESCRIPTION="KaTeX is a fast, easy-to-use JavaScript library for TeX math rendering on the web"
HOMEPAGE="https://github.com/KaTeX/KaTeX"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/commander
"
