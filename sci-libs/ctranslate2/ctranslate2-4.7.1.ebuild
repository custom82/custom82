# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit cmake python-single-r1

DESCRIPTION="Fast inference engine for Transformer models (C++ core + optional Python bindings)"
HOMEPAGE="https://opennmt.net/CTranslate2/ https://github.com/OpenNMT/CTranslate2"

SRC_URI="https://github.com/OpenNMT/CTranslate2/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/CTranslate2-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="
	cli
	cuda
	cudnn
	dnnl
	hip
	+mkl
	openblas
	python
	ruy
"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
	cudnn? ( cuda )
	|| ( mkl dnnl openblas ruy cuda hip )
"

# Core build deps
DEPEND="
	>=dev-build/cmake-3.15
	virtual/pkgconfig
"

# Backend deps (best-effort mapping ai nomi Gentoo più comuni)
DEPEND+="
	mkl? ( sci-libs/mkl )
	dnnl? ( sci-libs/onednn )
	openblas? ( sci-libs/openblas )
	cuda? ( dev-util/nvidia-cuda-toolkit )
	cudnn? ( dev-libs/cudnn )
	hip? ( dev-util/hip )
"

# Python wrapper deps (setup.py + pybind11; wheel/setuptools per build/install)
DEPEND+="
	python? (
		${PYTHON_DEPS}
		dev-python/pybind11[${PYTHON_SINGLE_USEDEP}]
		dev-python/setuptools[${PYTHON_SINGLE_USEDEP}]
		dev-python/wheel[${PYTHON_SINGLE_USEDEP}]
	)
"

RDEPEND="
	${DEPEND}
"

# Non abilito test: upstream ha test C++/Python ma richiedono modelli/dati e setup extra
RESTRICT="test"

pkg_setup() {
	use python && python-single-r1_pkg_setup
}

src_configure() {
	local mycmakeargs=(
		-DCMAKE_INSTALL_PREFIX=/usr
		-DBUILD_TESTS=OFF
		-DBUILD_CLI=$(usex cli ON OFF)

		-DWITH_MKL=$(usex mkl ON OFF)
		-DWITH_DNNL=$(usex dnnl ON OFF)
		-DWITH_OPENBLAS=$(usex openblas ON OFF)
		-DWITH_RUY=$(usex ruy ON OFF)

		-DWITH_CUDA=$(usex cuda ON OFF)
		-DWITH_CUDNN=$(usex cudnn ON OFF)
		-DWITH_HIP=$(usex hip ON OFF)
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	if use python; then
		python_setup

		# Il wrapper Python cerca la libreria installata; facciamo uno stage install in ${T}
		# e puntiamo CTRANSLATE2_ROOT lì durante la build del modulo.
		local stage="${T}/ctranslate2-stage"
		rm -rf "${stage}" || die
		mkdir -p "${stage}" || die

		cmake_build install DESTDIR="${stage}"

		pushd python >/dev/null || die
		export CTRANSLATE2_ROOT="${stage}/usr"
		export LD_LIBRARY_PATH="${CTRANSLATE2_ROOT}/lib:${LD_LIBRARY_PATH}"
		"${EPYTHON}" setup.py build || die "setup.py build failed"
		popd >/dev/null || die
	fi
}

src_install() {
	cmake_src_install

	if use python; then
		python_setup
		pushd python >/dev/null || die

		# Install del wrapper Python (riusa i build artifacts: --skip-build)
		export CTRANSLATE2_ROOT="${ED}/usr"
		"${EPYTHON}" setup.py install \
			--skip-build \
			--root="${D}" \
			--prefix="${EPREFIX}/usr" \
			--optimize=1 || die "setup.py install failed"

		popd >/dev/null || die
	fi

	dodoc README.md CHANGELOG.md || die
}
