# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Google Authentication Library: httplib2 transport"
HOMEPAGE="
	https://pypi.org/project/google-auth-httplib2/
	https://github.com/googleapis/google-auth-library-python-httplib2
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="test"

RDEPEND="
	>=dev-python/google-auth-1.32.0[${PYTHON_USEDEP}]
	<dev-python/google-auth-3[${PYTHON_USEDEP}]
	>=dev-python/httplib2-0.19.0[${PYTHON_USEDEP}]
	<dev-python/httplib2-1[${PYTHON_USEDEP}]
"
