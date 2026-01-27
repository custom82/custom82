# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="turndown"
inherit npm

DESCRIPTION="Convert HTML into Markdown with JavaScript"
HOMEPAGE="https://github.com/mixmark-io/turndown"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/mixmark-io-domino
"
