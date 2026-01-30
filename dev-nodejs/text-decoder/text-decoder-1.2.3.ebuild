# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="text-decoder"
inherit npm

DESCRIPTION="Streaming text decoder that preserves multibyte Unicode characters"
HOMEPAGE="https://github.com/holepunchto/text-decoder"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/b4a
"
