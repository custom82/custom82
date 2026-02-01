# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Google API Client Library for Python"
HOMEPAGE="https://github.com/googleapis/google-api-python-client/"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="test"

RDEPEND="
	<dev-python/httplib2-1.0.0[${PYTHON_USEDEP}]
	<dev-python/google-auth-3.0.0[${PYTHON_USEDEP}]
	<dev-python/google-auth-httplib2-1.0.0[${PYTHON_USEDEP}]
	<dev-python/google-api-core-3.0.0[${PYTHON_USEDEP}]
	<dev-python/uritemplate-5.0[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
"
