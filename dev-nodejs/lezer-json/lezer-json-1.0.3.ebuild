# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@lezer/json"
inherit npm

DESCRIPTION="This is a JSON grammar for the lezer parser system"
HOMEPAGE="https://github.com/lezer-parser/json"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/lezer-common
        dev-nodejs/lezer-highlight
        dev-nodejs/lezer-lr
"
