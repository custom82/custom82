# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm

DESCRIPTION="FlatBuffers is a cross platform serialization library architected for maximum memory efficiency"
HOMEPAGE="https://github.com/google/flatbuffers"




LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="

"

BDEPEND="
"

NPM_MODULE="flatbuffers"


npm_src_unpack() {
    unpack "${A}"
}
