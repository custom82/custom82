EAPI=8

PYTHON_COMPAT=( python3_{10,11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A lightweight LLVM Python binding for writing JIT compilers"
HOMEPAGE="https://github.com/numba/llvmlite https://pypi.org/project/llvmlite/"
SRC_URI="https://github.com/numba/llvmlite/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${PN}-${PV}"

LICENSE="BSD-2 Apache-2.0-with-LLVM-exceptions"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="!test? ( test )"

PATCHES="${FILESDIR}/llvmlite-0.46.0-llvm21.patch"

RDEPEND="
	${PYTHON_DEPS}
	llvm-core/llvm
"
DEPEND="${RDEPEND}"
BDEPEND="
	${PYTHON_DEPS}
	dev-util/cmake
	>=dev-python/setuptools-61[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest

pkg_setup() {
	if ! type -P llvm-config >/dev/null ; then
		die "llvm-config non trovato nel PATH (serve sys-devel/llvm e llvm-config visibile)"
	fi
}

python_compile() {
	# usa llvm-config di sistema (nessun path hardcoded)
	export LLVM_CONFIG="$(type -P llvm-config)"

	# ✅ bypass del check in ffi/CMakeLists.txt
	# 1) come env (propaga a ffi/build.py -> cmake)
	export LLVMLITE_SKIP_LLVM_VERSION_CHECK=1
	# 2) anche come -D per CMake, così siamo sicuri al 100%
	export CMAKE_ARGS="${CMAKE_ARGS} -DLLVMLITE_SKIP_LLVM_VERSION_CHECK=ON"

	distutils-r1_python_compile
}

python_test() {
	export LLVM_CONFIG="$(type -P llvm-config)"
	export LLVMLITE_SKIP_LLVM_VERSION_CHECK=1
	export CMAKE_ARGS="${CMAKE_ARGS} -DLLVMLITE_SKIP_LLVM_VERSION_CHECK=ON"
	epytest
}
