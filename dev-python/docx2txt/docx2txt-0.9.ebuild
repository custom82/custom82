EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Pure python-based utility to extract text and images from docx files"
HOMEPAGE="https://github.com/ankushshah89/python-docx2txt"
SRC_URI="https://github.com/ankushshah89/python-docx2txt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""

S=${WORKDIR}/python-docx2txt-${PV}

RDEPEND="
    app-arch/unzip
"
BDEPEND=""


distutils_enable_tests pytest
