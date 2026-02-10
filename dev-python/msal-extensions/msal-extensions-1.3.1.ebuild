# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Microsoft Authentication Extensions for Python (persistent token cache helpers for MSAL)"
HOMEPAGE="
	https://github.com/AzureAD/microsoft-authentication-extensions-for-python
	https://pypi.org/project/msal-extensions/
"

SRC_URI="https://github.com/AzureAD/microsoft-authentication-extensions-for-python/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"


S="${WORKDIR}/microsoft-authentication-extensions-for-python-${PV}"

RDEPEND="
	>=dev-python/msal-1.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
