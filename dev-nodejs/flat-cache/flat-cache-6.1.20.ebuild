# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="flat-cache"
inherit npm

DESCRIPTION="A simple key/value storage using files to persist the data"
HOMEPAGE="https://github.com/jaredwray/cacheable"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cacheable
        dev-nodejs/flatted
        dev-nodejs/hookified
"
