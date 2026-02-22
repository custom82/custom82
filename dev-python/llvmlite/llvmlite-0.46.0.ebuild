# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

# MUST be set before inheriting llvm-r1
LLVM_COMPAT=( 21 )

inherit distutils-r1 llvm-r1

DESCRIPTION="A lightweight LLVM Python binding for writing JIT compilers"
HOMEPAGE="https://github.com/numba/llvmlite https://pypi.org/project/llvmlite/"
SRC_URI="https://github.com/numba/llvmlite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}-${PV}"

LICENSE="BSD-2 Apache-2.0-with-LLVM-exceptions"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="!test? ( test )"

PATCHES=( "${FILESDIR}/llvmlite-0.46.0-llvm21.patch" 
		  "${FILESDIR}/llvmlite-0.46.0-spawn.patch" 
)

RDEPEND="
	${PYTHON_DEPS}
	$(llvm_gen_dep 'llvm-core/llvm:${LLVM_SLOT}')
"
DEPEND="${RDEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	dev-build/cmake
	>=dev-python/setuptools-61[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

pkg_setup() {
	llvm-r1_pkg_setup
	python_setup
}

python_compile() {
	# llvm-r1_pkg_setup selects LLVM slot and adjusts PATH accordingly
	export LLVM_CONFIG="$(type -P llvm-config)" || die "llvm-config not found (slot ${LLVM_SLOT})"
	"${LLVM_CONFIG}" --version >/dev/null || die "llvm-config is not runnable"

	# Bypass hard version checks (needed for llvm21 patch setups)
	export LLVMLITE_SKIP_LLVM_VERSION_CHECK=1
	export CMAKE_ARGS+=" -DLLVMLITE_SKIP_LLVM_VERSION_CHECK=ON"

	distutils-r1_python_compile
}

python_test() {
	export LLVM_CONFIG="$(type -P llvm-config)" || die "llvm-config not found (slot ${LLVM_SLOT})"
	"${LLVM_CONFIG}" --version >/dev/null || die "llvm-config is not runnable"

	export LLVMLITE_SKIP_LLVM_VERSION_CHECK=1
	export CMAKE_ARGS+=" -DLLVMLITE_SKIP_LLVM_VERSION_CHECK=ON"

	epytest
}
