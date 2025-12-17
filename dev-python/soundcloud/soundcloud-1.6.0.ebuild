# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A Python wrapper for the SoundCloud API"
HOMEPAGE="https://github.com/7x11x13/soundcloud.py"
SRC_URI="https://github.com/7x11x13/soundcloud.py/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
    >=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
    >=dev-python/simplejson-3.0.0[${PYTHON_USEDEP}]
"

RESTRICT="test"

S="${WORKDIR}/soundcloud.py-${PV}"
