# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Microsoft Authentication Library for JavaScript (MSAL.js) for Browser-Based Single-Page Applications"
HOMEPAGE="https://github.com/AzureAD/microsoft-authentication-library-for-js"
SRC_URI="https://github.com/AzureAD/microsoft-authentication-library-for-js/archive/refs/tags/${PN}-v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="dev-nodejs/msal-common"

NPM_EXTRA_FILES="typedoc.json typedoc.base.json shared-test-utils shared-configs release-scripts regression-tests extensions dev-scripts api-extractor-base.json"

npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}/microsoft-authentication-library-for-js-msal-browser-v${PV}" ${S}
}

