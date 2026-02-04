# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@lezer/highlight"
inherit npm

DESCRIPTION="Lezer is an incremental parser system intended for use in an editor or similar system"
HOMEPAGE="https://github.com/lezer-parser/highlight"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/lezer-common
"
