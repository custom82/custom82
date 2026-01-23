# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="Mold is a minimalist templating library that compiles strings containing templating directives to functions that instantiate the template"
HOMEPAGE="https://github.com/marijnh/mold"
SRC_URI="https://github.com/marijnh/mold/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="mold.js"

npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/mold-${PV} "${S}"
}


