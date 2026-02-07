# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Create, read, and update PowerPoint 2007+ (.pptx) files"
HOMEPAGE="
	https://github.com/scanny/python-pptx
	https://python-pptx.readthedocs.io/
"
SRC_URI="https://github.com/scanny/python-pptx/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/xlsxwriter[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

S="${WORKDIR}/python-pptx-${PV}"

distutils_enable_tests pytest
