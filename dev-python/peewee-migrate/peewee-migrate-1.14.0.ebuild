EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

DESCRIPTION="Migration engine for Peewee ORM"
HOMEPAGE="https://github.com/klen/peewee_migrate"
SRC_URI="https://github.com/klen/peewee_migrate/archive/refs/tags/${PV}.tar.gz  -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S=${WORKDIR}/peewee_migrate-${PV}

RDEPEND="
    dev-python/peewee[${PYTHON_USEDEP}]
"

BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest
