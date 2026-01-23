# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="This is a tool for extracting documentation and typing information from TypeScript sources"
HOMEPAGE="https://github.com/kumavis/browser-stdout"
SRC_URI="https://github.com/kumavis/browser-stdout/archive/refs/heads/master.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"


npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}"/"${PN}-master" ${S}
}
