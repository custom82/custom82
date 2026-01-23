# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This is a utility that transforms code documented with getdocs-style doc comments into HTML"
HOMEPAGE="https://github.com/marijnh/builddocs"
SRC_URI="https://github.com/marijnh/builddocs/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="src bin"

npm_src_unpack() {
    unpack "${A}"
}
