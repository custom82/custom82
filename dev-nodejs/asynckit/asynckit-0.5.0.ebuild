# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="asynckit"
inherit npm

DESCRIPTION="Minimal async jobs utility library, with streams support"
HOMEPAGE="https://github.com/alexindigo/asynckit"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/asynckit
        dev-nodejs/combined-stream
        dev-nodejs/es-set-tostringtag
        dev-nodejs/hasown
        dev-nodejs/mime-types
"
