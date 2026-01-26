# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@antfu/install-pkg"
inherit npm

DESCRIPTION="Install package programmatically. Detect package managers automatically"
HOMEPAGE="https://github.com/antfu/install-pkg"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/package-manager-detector
        dev-nodejs/tinyexec
"
