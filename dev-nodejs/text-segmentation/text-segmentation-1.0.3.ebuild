# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="text-segmentation"
inherit npm

DESCRIPTION="A JavaScript library for Grapheme Breaking and identifying Grapheme Boundaries"
HOMEPAGE="https://github.com/niklasvh/text-segmentation"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/utrie
"
