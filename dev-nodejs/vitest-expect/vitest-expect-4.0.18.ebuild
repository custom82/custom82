# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@vitest/expect"
inherit npm

DESCRIPTION="Jest's expect matchers as a Chai plugin"
HOMEPAGE="https://github.com/vitest-dev/vitest"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/standard-schema-spec
        dev-nodejs/types-chai
        dev-nodejs/vitest-spy
        dev-nodejs/vitest-utils
        dev-nodejs/chai
        dev-nodejs/tinyrainbow
"
