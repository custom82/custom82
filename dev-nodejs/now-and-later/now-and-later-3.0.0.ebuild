# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="now-and-later"
inherit npm

DESCRIPTION="Converts a source-map from/to different formats and allows adding/changing properties"
HOMEPAGE="https://github.com/gulpjs/now-and-later"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/once
"
