# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="rimraf"
inherit npm

DESCRIPTION="The UNIX command rm -rf for node in a cross-platform implementation."
HOMEPAGE="https://github.com/isaacs/rimraf"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/glob
        dev-nodejs/package-json-from-dist
"
