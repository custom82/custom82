# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@vitest/utils"
inherit npm

DESCRIPTION="Next generation testing framework powered by Vite"
HOMEPAGE="https://github.com/vitest-dev/vitest"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/vitest-pretty-format
        dev-nodejs/tinyrainbow
"
