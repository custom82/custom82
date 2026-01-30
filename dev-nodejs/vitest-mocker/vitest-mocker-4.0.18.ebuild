# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@vitest/mocker"
inherit npm

DESCRIPTION="Vitest's module mocker implementation"
HOMEPAGE="https://github.com/vitest-dev/vitest"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vitest-spy
        dev-nodejs/estree-walker
        dev-nodejs/magic-string
"
