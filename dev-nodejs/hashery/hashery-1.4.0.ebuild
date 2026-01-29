# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="hashery"
inherit npm

DESCRIPTION="Browser / Nodejs Compatible Object Hashing"
HOMEPAGE="https://github.com/jaredwray/hashery"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/hookified
"
