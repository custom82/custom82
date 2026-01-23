# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="Minimal CSS module shim for generating CSS rules for sets of style -declarations and attaching such a set to a document or shadow root"
HOMEPAGE="https://github.com/marijnh/style-mod"
SRC_URI="https://github.com/marijnh/style-mod/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

BDEPEND="
        dev-nodejs/buble
        dev-nodejs/builddocs
        dev-nodejs/ist
        dev-nodejs/mocha
"



NPM_MODULE="style-mod"

NPM_EXTRA_FILES="src"


npm_src_unpack() {
    unpack "${A}"
}
