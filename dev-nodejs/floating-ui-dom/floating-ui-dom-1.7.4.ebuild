# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="This is the library to use Floating UI on the web, wrapping @floating-ui/core with DOM interface logic"
HOMEPAGE="https://github.com/floating-ui/floating-ui"
SRC_URI="https://github.com/floating-ui/floating-ui/archive/refs/tags/@floating-ui/dom@${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
        dev-nodejs/floating-ui-core
        dev-nodejs/floating-ui-utils
        dev-nodejs/lezer-highlight
        dev-nodejs/lezer-lr
"

BDEPEND="
        dev-nodejs/types-react
        dev-nodejs/types-react-dom
        dev-nodejs/vitejs-plugin-react
        dev-nodejs/config
        dev-nodejs/react
        dev-nodejs/react-dom
        dev-nodejs/react-rotuer-dom
"

NPM_MODULE="@floating-ui/dom"

NPM_EXTRA_FILES="website turbo.json pnpm-workspace.yaml pnpm-lock.yaml packages package.json extension eslint.config.mjs config"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/floating-ui--floating-ui-dom-${PV} "${S}"
}

