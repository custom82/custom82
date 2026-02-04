# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="i18next-resources-to-backend"
inherit npm

DESCRIPTION="This package helps to transform resources to an i18next backend"
HOMEPAGE="https://github.com/i18next/i18next-resources-to-backend"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/babel-runtime
"
