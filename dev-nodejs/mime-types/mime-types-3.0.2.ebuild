# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="mime-types"
inherit npm

DESCRIPTION="The ultimate javascript content-type utility"
HOMEPAGE="https://github.com/jshttp/mime-types"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/mime-db
"
