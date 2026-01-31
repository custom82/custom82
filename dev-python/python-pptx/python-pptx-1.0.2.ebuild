# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Library to create, read and update PowerPoint .pptx files"
HOMEPAGE="https://pypi.org/project/python-pptx/"
SRC_URI="https://files.pythonhosted.org/packages/source/p/python-pptx/python_pptx-${PV}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

RDEPEND="
    dev-python/lxml
    dev-python/Pillow
    dev-python/typing-extensions
    dev-python/XlsxWriter
"

DEPEND="
    ${RDEPEND}
    dev-python/setuptools
"

# Python packaging helpers ensure setup.py install is used
PYDISTUTILS_BUILD_BLACKLISTED_ARCHES=""

# Optional: if building docs/tests
# HOMEPAGE_DOCS="https://python-pptx.readthedocs.io/"
# DOCS_DEPEND="dev-python/Sphinx"

src_install() {
    distutils-r1_src_install
}
