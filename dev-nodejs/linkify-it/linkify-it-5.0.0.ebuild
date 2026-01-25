# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="linkify-it"
inherit npm

DESCRIPTION="Links recognition library with FULL unicode support"
HOMEPAGE="https://github.com/markdown-it/linkify-it"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/uc-micro
"
