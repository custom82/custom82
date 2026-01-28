# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="verror"
inherit npm

DESCRIPTION="This module provides several classes in support of Joyent's Best Practices for Error Handling in Node.js"
HOMEPAGE="https://github.com/joyent/node-verror"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/assert-plus
        dev-nodejs/core-util-is
        dev-nodejs/extsprintf
"
