# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Google Authentication Library, oauthlib integration with google-auth"
HOMEPAGE="https://github.com/googleapis/google-auth-library-python-oauthlib"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="tool"
RESTRICT="test"

RDEPEND="
	<dev-python/google-auth-3.0.0[${PYTHON_USEDEP}]
	>=dev-python/requests-oauthlib-0.7.0[${PYTHON_USEDEP}]
	tool? ( >=dev-python/click-6.0[${PYTHON_USEDEP}] )
"
BDEPEND="${RDEPEND}"
