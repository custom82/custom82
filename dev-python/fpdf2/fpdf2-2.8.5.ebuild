EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Simple & fast PDF generation for Python"
HOMEPAGE="https://github.com/py-pdf/fpdf2"
SRC_URI="https://github.com/py-pdf/fpdf2/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/defusedxml[${PYTHON_USEDEP}]
	dev-python/fonttools[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
