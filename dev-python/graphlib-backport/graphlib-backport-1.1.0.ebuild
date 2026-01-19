# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Graphlib Backport"
HOMEPAGE="https://github.com/mariushelf/graphlib_backport"
SRC_URI="https://github.com/mariushelf/graphlib_backport/archive/refs/tags/1.1.0.tar.gz -> ${P}.tar.gz"

LICENSE="PSF"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
S="${WORKDIR}/graphlib_backport-${PV}"

RDEPEND="
	dev-python/peewee[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

