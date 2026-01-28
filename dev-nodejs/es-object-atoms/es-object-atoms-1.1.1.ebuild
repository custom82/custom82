# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="es-object-atoms"
inherit npm

DESCRIPTION="ES Object-related atoms: Object, ToObject, RequireObjectCoercible"
HOMEPAGE="https://github.com/ljharb/es-object-atoms"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/es-errors
"
