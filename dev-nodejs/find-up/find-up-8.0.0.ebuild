# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="find-up"
inherit npm

DESCRIPTION="Find a file or directory by walking up parent directories or down descendant directories"
HOMEPAGE="https://github.com/sindresorhus/find-up"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/locate-path
        dev-nodejs/unicorn-magic
"
