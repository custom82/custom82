# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

inherit npm npm-tools

DESCRIPTION="Microsoft Authentication Library for JavaScript"
HOMEPAGE="https://github.com/AzureAD/microsoft-authentication-library-for-js"
SRC_URI="https://github.com/AzureAD/microsoft-authentication-library-for-js/archive/refs/tags/${PN}-v${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

NPM_EXTRA_FILES="typedoc.json typedoc.base.json tsconfig.json shared-test-utils shared-configs lib extensions api-extractor-base.json"

npm_src_unpack() {
    unpack "${A}"
    mv "${WORKDIR}/microsoft-authentication-library-for-js-msal-common-v${PV}" ${S}
}

