# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Python library to convert Japanese Kana-kanji sentences into Kana or Romaji"
HOMEPAGE="https://github.com/miurahr/pykakasi"
SRC_URI="https://github.com/miurahr/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
    >=dev-python/rapidfuzz-3.0.0[${PYTHON_USEDEP}]
    >=dev-python/jaconv-0.3.0[${PYTHON_USEDEP}]
    >=dev-python/click-8.0.0[${PYTHON_USEDEP}]
"
BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-cov[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest
