# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="markdown-it"
inherit npm

DESCRIPTION="Markdown parser done right. Fast and easy to extend"
HOMEPAGE="https://github.com/markdown-it/markdown-it"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/argparse
        dev-nodejs/entities
        dev-nodejs/linkify-it
        dev-nodejs/mdurl
        dev-nodejs/punycode-js
        dev-nodejs/uc-micro
"
