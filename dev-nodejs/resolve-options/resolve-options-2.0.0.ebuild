# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="resolve-options"
inherit npm

DESCRIPTION="Resolve an options object based on configuration"
HOMEPAGE="https://github.com/gulpjs/resolve-options"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/value-or-function
"
