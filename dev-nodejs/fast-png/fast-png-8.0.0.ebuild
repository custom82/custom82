# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="fast-png"
inherit npm

DESCRIPTION="PNG image decoder and encoder written entirely in JavaScript"
HOMEPAGE="https://github.com/image-js/fast-png"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/iobuffer
        dev-nodejs/fflate
"
