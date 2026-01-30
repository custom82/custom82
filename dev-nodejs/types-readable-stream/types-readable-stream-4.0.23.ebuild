# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@types/readable-stream"
inherit npm

DESCRIPTION="This package contains type definitions for readable-stream"
HOMEPAGE="https://github.com/DefinitelyTyped/DefinitelyTyped"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
         dev-nodejs/types-node
"
