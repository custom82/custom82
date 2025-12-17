# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="Get an LRC format (synchronized) lyrics for your music"
HOMEPAGE="https://github.com/moehmeni/syncedlyrics"
SRC_URI="https://github.com/moehmeni/${PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
    >=dev-python/requests-2.25.0[${PYTHON_USEDEP}]
    >=dev-python/beautifulsoup4-4.9.0[${PYTHON_USEDEP}]
"
BDEPEND="
    dev-python/poetry-core[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest

src_prepare() {
    # Rimuove i vincoli di versione eccessivi se necessario
    sed -i -e '/pytest/d' pyproject.toml || die
    distutils-r1_src_prepare
}
