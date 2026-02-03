# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=poetry

inherit pypi distutils-r1

DESCRIPTION="Simple migration engine for Peewee ORM"
HOMEPAGE="https://github.com/klen/peewee_migrate"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND="
    dev-python/peewee[${PYTHON_USEDEP}]
"

RDEPEND="${DEPEND}"

# Tests (optional)
DEPEND+="
    dev-python/pyproject-build[${PYTHON_USEDEP}]
    dev-python/pytest[${PYTHON_USEDEP}]
"

src_test() {
    # Run basic package tests if available
    pytest -q
}
