# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="npm-run-path"
inherit npm

DESCRIPTION="Get your PATH prepended with locally installed binaries"
HOMEPAGE="https://github.com/sindresorhus/npm-run-path"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/path-key
        dev-nodejs/unicorn-magic
"
