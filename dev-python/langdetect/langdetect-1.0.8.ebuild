EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Language detection library ported from Google's language-detection"
HOMEPAGE="
    https://github.com/Mimino666/langdetect
    https://pypi.org/project/langdetect/
"

SRC_URI="https://github.com/Mimino666/langdetect/archive/refs/tags/${PV}.tar.gz
    -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    $(python_gen_cond_dep '
        dev-python/six[${PYTHON_USEDEP}]
    ')
"

distutils_enable_tests pytest
