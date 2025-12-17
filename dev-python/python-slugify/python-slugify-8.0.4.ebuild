# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A Python slugify application that handles unicode"
HOMEPAGE="https://github.com/un33k/python-slugify"
SRC_URI="https://github.com/un33k/"${PN}"/archive/refs/tags/v"${PV}".tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
    >=dev-python/text-unidecode-1.3[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest
