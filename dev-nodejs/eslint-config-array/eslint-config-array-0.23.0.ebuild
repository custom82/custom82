# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@eslint/config-array"
inherit npm

DESCRIPTION="A config array is a way of managing configurations that are based on glob pattern matching of filenames"
HOMEPAGE="https://github.com/eslint/rewrite"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/eslint-object-schema
        dev-nodejs/debug
        dev-nodejs/minimatch
"
