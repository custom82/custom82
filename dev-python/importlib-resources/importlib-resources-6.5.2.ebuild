# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Read resources from Python packages"
HOMEPAGE="https://github.com/python/importlib_resources"
SRC_URI="https://github.com/python/importlib_resources/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.tar.gz"

S="${WORKDIR}/importlib_resources-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RESTRICT="!test? ( test )"

BDEPEND="
	>=dev-python/setuptools-77[${PYTHON_USEDEP}]
	>=dev-python/setuptools-scm-3.4.1[toml,${PYTHON_USEDEP}]
	>=dev-python/wheel-0.40[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-6[${PYTHON_USEDEP}]
		!=dev-python/pytest-8.1*[${PYTHON_USEDEP}]
		>=dev-python/jaraco-test-5.4[${PYTHON_USEDEP}]
	)
"

RDEPEND=""

python_compile() {
	# GitHub tarballs don't have SCM metadata; force version for setuptools-scm.
	export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_IMPORTLIB_RESOURCES="${PV}"
	distutils-r1_python_compile
}

python_install() {
	export SETUPTOOLS_SCM_PRETEND_VERSION_FOR_IMPORTLIB_RESOURCES="${PV}"
	distutils-r1_python_install
}

distutils_enable_tests pytest
