# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This is the platform-agnostic core of Floating UI, exposing the main computePosition function but no platform interface logic"
HOMEPAGE="https://github.com/floating-ui/floating-ui"
SRC_URI="https://github.com/floating-ui/floating-ui/archive/refs/tags/@floating-ui/utils@${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/testing-library-jest-dom
        dev-nodejs/config
"

NPM_MODULE="@floating-ui/utils"

NPM_EXTRA_FILES="website turbo.json pnpm-workspace.yaml pnpm-lock.yaml packages extension eslint.config.mjs config"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/floating-ui--floating-ui-utils-${PV} "${S}"
}

