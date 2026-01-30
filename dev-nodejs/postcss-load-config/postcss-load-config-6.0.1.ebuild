# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="postcss-load-config"
inherit npm

DESCRIPTION="PostCSS plugins"
HOMEPAGE="https://github.com/postcss/postcss-load-config"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/lilconfig
"
