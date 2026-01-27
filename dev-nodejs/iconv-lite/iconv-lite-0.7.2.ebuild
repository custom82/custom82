# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="iconv-lite"
inherit npm

DESCRIPTION="Pure JS character encoding conversion"
HOMEPAGE="https://github.com/pillarjs/iconv-lite"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/safer-buffer
"
