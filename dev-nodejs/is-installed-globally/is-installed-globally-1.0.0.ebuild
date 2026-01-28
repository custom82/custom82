# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="is-installed-globally"
inherit npm

DESCRIPTION="Check if your package was installed globally"
HOMEPAGE="https://github.com/sindresorhus/is-installed-globally"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/global-directory
        dev-nodejs/is-path-inside
"
