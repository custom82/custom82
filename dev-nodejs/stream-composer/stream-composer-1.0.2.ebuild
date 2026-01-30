# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="stream-composer"
inherit npm

DESCRIPTION="Modern stream composer"
HOMEPAGE="https://github.com/mafintosh/stream-composer"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/streamx
"
