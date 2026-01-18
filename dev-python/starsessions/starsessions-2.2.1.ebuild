# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=hatchling
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Advanced sessions for Starlette and FastAPI frameworks"
HOMEPAGE="https://github.com/alex-oleshkevich/starsessions"
SRC_URI="https://github.com/alex-oleshkevich/starsessions/archive/refs/tags/v2.2.1.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
	>=dev-python/starlette-0.27.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

