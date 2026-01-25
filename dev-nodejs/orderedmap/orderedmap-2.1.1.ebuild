# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="orderedmap"
inherit npm

DESCRIPTION="Persistent data structure representing an ordered mapping from strings to values, with some convenient update methods"
HOMEPAGE="https://github.com/marijnh/orderedmap"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/orderedmap
"
