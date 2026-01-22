# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=meson-python
PYTHON_COMPAT=( python3_{10..14} )

inherit distutils-r1

DESCRIPTION="Machine learning library for Python"
HOMEPAGE="https://scikit-learn.org/"
SRC_URI="https://files.pythonhosted.org/packages/source/s/scikit-learn/scikit_learn-${PV}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

S="${WORKDIR}/scikit_learn-${PV}"

IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/numpy-1.23[${PYTHON_USEDEP}]
	>=dev-python/scipy-1.9[${PYTHON_USEDEP}]
	>=dev-python/joblib-1.2[${PYTHON_USEDEP}]
	>=dev-python/threadpoolctl-3.1[${PYTHON_USEDEP}]
"

DEPEND="
	${RDEPEND}
	>=dev-python/cython-3.0[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/meson-python-0.14[${PYTHON_USEDEP}]
	dev-build/meson
	dev-build/ninja
"

src_configure() {
	# disabilitiamo OpenMP (problemi frequenti con sandbox / clang)
	export SKLEARN_NO_OPENMP=1
	distutils-r1_src_configure
}

python_test() {
	# test estremamente pesanti → opzionali
	epytest -k "not test_openmp"
}
