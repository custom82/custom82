# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@types/node"
inherit npm

DESCRIPTION="This package contains type definitions for node"
HOMEPAGE="https://github.com/DefinitelyTyped/DefinitelyTyped"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/undici-types
"
