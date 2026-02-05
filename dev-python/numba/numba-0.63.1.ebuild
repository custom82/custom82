EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Numba gives you the power to speed up your applications with high performance functions"
HOMEPAGE="
	https://numba.pydata.org/
	https://github.com/numba/numba
"
SRC_URI="https://github.com/numba/numba/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/llvmlite[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

S="${WORKDIR}/numba-${PV}"

python_prepare_all() {
	sed -i "s/use_scm_version=True/use_scm_version=False/" setup.py || die
	distutils-r1_python_prepare_all
}
