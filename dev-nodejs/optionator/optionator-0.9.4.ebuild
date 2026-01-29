# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="optionator"
inherit npm

DESCRIPTION="Optionator is a JavaScript/Node.js option parsing and help generation library used by eslint"
HOMEPAGE="https://github.com/gkz/optionator"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/deep-is
        dev-nodejs/fast-levenshtein
        dev-nodejs/levn
        dev-nodejs/prelude-ls
        dev-nodejs/type-check
        dev-nodejs/word-wrap
"
