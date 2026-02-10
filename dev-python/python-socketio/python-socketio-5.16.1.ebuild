# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Socket.IO server and client for Python"
HOMEPAGE="https://github.com/miguelgrinberg/python-socketio"
SRC_URI="https://github.com/miguelgrinberg/python-socketio/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="!test? ( test )"

# GitHub tag tarball directory name is typically python-socketio-${PV}
S="${WORKDIR}/python-socketio-${PV}"

RDEPEND="
	>=dev-python/bidict-0.21.0[${PYTHON_USEDEP}]
	>=dev-python/python-engineio-4.12.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		$(python_gen_cond_dep '
			>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
			>=dev-python/pytest-asyncio-0.21.0[${PYTHON_USEDEP}]
		')
	)
"

distutils_enable_tests pytest
