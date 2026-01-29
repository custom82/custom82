# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="broccoli-output-wrapper"
inherit npm

DESCRIPTION="This libary is to provide Proxy to FS operations for Broccoli"
HOMEPAGE="https://www.npmjs.com/package/broccoli-output-wrapper"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/fs-extra
        dev-nodejs/heimdalljs-logger
        dev-nodejs/symlink-or-copy
"
