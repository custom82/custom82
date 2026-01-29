# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="fast-levenshtein"
inherit npm

DESCRIPTION="fast-levenshtein - Levenshtein algorithm in Javascript"
HOMEPAGE="https://github.com/hiddentao/fast-levenshtein"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/fastest-levenshtein
"
