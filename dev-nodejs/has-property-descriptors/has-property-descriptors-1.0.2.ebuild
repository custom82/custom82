# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="has-property-descriptors"
inherit npm

DESCRIPTION="Handles IE 8's broken defineProperty/gOPD"
HOMEPAGE="https://github.com/inspect-js/has-property-descriptors"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/es-define-property
"
