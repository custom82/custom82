# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools

inherit pypi distutils-r1

DESCRIPTION="pyxlsb is an Excel 2007-2010 Binary Workbook (xlsb) parser for Python"
HOMEPAGE="https://pypi.org/project/pyxlsb/"
SRC_URI="$(pypi_sdist_url pyxlsb ${PV})"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RESTRICT="test"
