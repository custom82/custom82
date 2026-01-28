# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="mime-db"
inherit npm

DESCRIPTION="This is a large database of mime types and information about them"
HOMEPAGE="https://github.com/jshttp/mime-db"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/mime-db
"
