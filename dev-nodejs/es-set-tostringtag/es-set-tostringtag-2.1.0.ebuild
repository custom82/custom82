# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="es-set-tostringtag"
inherit npm

DESCRIPTION="A helper to optimistically set Symbol.toStringTag, when possible"
HOMEPAGE="https://github.com/es-shims/es-set-tostringtag"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/es-errors
        dev-nodejs/get-intrinsic
        dev-nodejs/has-tostringtag
        dev-nodejs/hasown
"
