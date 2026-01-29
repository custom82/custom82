# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@keyv/bigmap"
inherit npm

DESCRIPTION="Bigmap for Keyv"
HOMEPAGE="https://github.com/jaredwray/keyv"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/hashery
        dev-nodejs/hookified
"
