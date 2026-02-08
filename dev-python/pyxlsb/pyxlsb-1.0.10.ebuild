EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Excel 2007-2010 Binary Workbook (xlsb) parser"
HOMEPAGE="https://github.com/willtrnr/pyxlsb"
SRC_URI="https://github.com/willtrnr/pyxlsb/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    dev-python/lxml[${PYTHON_USEDEP}]
"
BDEPEND=""

S="${WORKDIR}/${PN}-${PV}"
