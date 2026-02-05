EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="ISO 639 language codes (python-iso639)"
HOMEPAGE="
	https://github.com/jacksonllee/iso639
	https://pypi.org/project/python-iso639/
"
SRC_URI="https://github.com/jacksonllee/iso639/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

# L'archivio GitHub estrae in: iso639-${PV}
S="${WORKDIR}/iso639-${PV}"

RDEPEND=""
BDEPEND="
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest
