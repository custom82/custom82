# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="tough-cookie"
inherit npm

DESCRIPTION="A Node.js implementation of RFC6265 for cookie parsing, storage, and retrieval"
HOMEPAGE="https://github.com/salesforce/tough-cookie"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/tldts
"
