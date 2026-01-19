# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Python extension for MurmurHash (MurmurHash3)"
HOMEPAGE="https://github.com/hajimes/mmh3"
SRC_URI="https://github.com/hajimes/mmh3/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64"

distutils_enable_tests pytest

python_test() {
	epytest -o "addopts="
}
