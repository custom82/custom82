# Copyright 1999-2023 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1
DESCRIPTION="the open-source embedding database"
HOMEPAGE="https://pypi.org/project/chromadb/"
SRC_URI="https://files.pythonhosted.org/packages/03/35/24479ac00e74b86e388854a573a9ebe6d41c51c37e03d00864bb967d861f/chromadb-1.4.1.tar.gz -> ${P}.tar.gz"

LICENSE="Apache 2.0"
SLOT="0"
KEYWORDS="amd64 arm arm64 x86"
IUSE="test"
RESTRICT="!test? ( test )"

DOCS="README.rst"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)"

python_test() {
	py.test -v -v || die
}

distutils_enable_tests pytest
