# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@azure/msal-common"
inherit npm

DESCRIPTION="Microsoft Authentication Library for JavaScript (MSAL.js) for Browser-Based Single-Page Applications"
HOMEPAGE="https://github.com/AzureAD/microsoft-authentication-library-for-js"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="dist"

npm_src_unpack () {
        unpack ${A}
        mv ${WORKDIR}/package "${S}"
}

