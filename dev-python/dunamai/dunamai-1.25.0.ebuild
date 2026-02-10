EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Dynamic versioning from VCS tags"
HOMEPAGE="https://github.com/mtkennerly/dunamai"
SRC_URI="https://github.com/mtkennerly/dunamai/archive/refs/tags/v${PV}.tar.gz
    -> ${P}.gh.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="
    $(python_gen_cond_dep '
        >=dev-python/packaging-20.9[${PYTHON_USEDEP}]
    ')
"

BDEPEND="
    test? (
        $(python_gen_cond_dep '
            dev-python/pytest[${PYTHON_USEDEP}]
        ')
    )
"

distutils_enable_tests pytest
