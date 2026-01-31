# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="FPDF for Python: simple PDF generation"
HOMEPAGE="https://py-pdf.github.io/fpdf2/ https://pypi.org/project/fpdf2/"

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/fonttools[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
