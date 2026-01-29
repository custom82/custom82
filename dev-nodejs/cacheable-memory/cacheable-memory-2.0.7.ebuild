# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@cacheable/memory"
inherit npm

DESCRIPTION="High Performance Layer 1 / Layer 2 Caching with Keyv Storage"
HOMEPAGE="https://github.com/jaredwray/cacheable"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/cacheable-utils
        dev-nodejs/keyv-bigmap
        dev-nodejs/hookified
        dev-nodejs/keyv
"
