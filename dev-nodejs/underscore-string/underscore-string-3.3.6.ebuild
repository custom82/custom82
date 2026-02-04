# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="underscore.string"
inherit npm

DESCRIPTION="Javascript lacks complete string manipulation operations"
HOMEPAGE="https://github.com/epeli/underscore.string"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/sprintf-js
        dev-nodejs/util-deprecate
"
