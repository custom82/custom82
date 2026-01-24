# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="Global HTTP/HTTPS proxy configurable using environment variables"
HOMEPAGE="https://github.com/gajus/global-agent"
SRC_URI="https://github.com/gajus/global-agent/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"



LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="

"

BDEPEND="
"

NPM_MODULE="global-agent"
NPM_EXTRA_FILES="tsconfig.json bootstrap.js .travis.yml .npmrc .npmignore .eslintrc .eslintignore .editorconfig .babelrc src"

npm_src_unpack() {
    unpack "${A}"
}
