EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit cmake python-r1 flag-o-matic

DESCRIPTION="Fast inference engine for Transformer models (OpenNMT)"
HOMEPAGE="https://github.com/OpenNMT/CTranslate2"

SRC_URI="
	https://github.com/OpenNMT/CTranslate2/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/gabime/spdlog/archive/refs/tags/v1.14.1.tar.gz -> spdlog-1.14.1.tar.gz
	https://github.com/google/cpu_features/archive/refs/tags/v0.9.0.tar.gz -> cpu_features-0.9.0.tar.gz
	cli? ( https://github.com/jarro2783/cxxopts/archive/refs/tags/v3.2.0.tar.gz -> cxxopts-3.2.0.tar.gz )
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="cli openmp python test"
RESTRICT="!test? ( test )"

REQUIRED_USE="
	python? ( ${PYTHON_REQUIRED_USE} )
"

DEPEND="
	dev-libs/cpuinfo
	dev-cpp/eigen
	dev-cpp/nlohmann_json
	dev-libs/half
"
RDEPEND="
	${DEPEND}
	python? (
		$(python_gen_cond_dep '
			dev-python/pybind11[${PYTHON_USEDEP}]
		')
	)
"
BDEPEND="
	virtual/pkgconfig
	python? (
		${PYTHON_DEPS}
		$(python_gen_cond_dep '
			dev-python/build[${PYTHON_USEDEP}]
			dev-python/installer[${PYTHON_USEDEP}]
			dev-python/setuptools[${PYTHON_USEDEP}]
			dev-python/wheel[${PYTHON_USEDEP}]
		')
	)
"

S="${WORKDIR}/CTranslate2-${PV}"

src_prepare() {
	rm -f .gitmodules || die
	cmake_src_prepare

	# Popola i submodule mancanti nel tarball release.
	rm -rf third_party/spdlog third_party/cpu_features third_party/cxxopts || die
	mkdir -p third_party || die

	cp -a "${WORKDIR}/spdlog-1.14.1" third_party/spdlog || die
	cp -a "${WORKDIR}/cpu_features-0.9.0" third_party/cpu_features || die

	if use cli; then
		cp -a "${WORKDIR}/cxxopts-3.2.0" third_party/cxxopts || die
	fi

	eapply "${FILESDIR}/ctranslate-gcc15-fix.patch"
	eapply "${FILESDIR}/ctranslate2-4.7.1-unpin-pybind11.patch"
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON
		-DTHREADS_PREFER_PTHREAD_FLAG=ON

		# OpenMP: per 4.7.1 runtime validi sono INTEL/COMP/NONE (GOMP non esiste)
		-DWITH_OPENMP="$(usex openmp ON OFF)"
		-DOPENMP_RUNTIME="$(usex openmp COMP NONE)"

		-DWITH_MKL=OFF
		-DBUILD_CLI="$(usex cli ON OFF)"
		-DBUILD_TESTS="$(usex test ON OFF)"
	)
	cmake_src_configure

	# build dir del core (dove viene generata libctranslate2.so*)
	CT2_CORE_BUILD_DIR=${BUILD_DIR}
}

ctranslate2_python_compile() {
	local outdir="dist-${EPYTHON}"

	pushd "${S}/python" >/dev/null || die

	append-cppflags "-I${S}/include"
	append-cxxflags "-I${S}/include"

	# link contro la lib del core appena compilata (in build dir)
	append-ldflags "-L${CT2_CORE_BUILD_DIR}"
	append-ldflags "-Wl,-rpath-link,${CT2_CORE_BUILD_DIR}"
	# utile durante build/run di eventuali helper
	append-ldflags "-Wl,-rpath,${CT2_CORE_BUILD_DIR}"

	export LIBRARY_PATH="${CT2_CORE_BUILD_DIR}${LIBRARY_PATH:+:${LIBRARY_PATH}}"
	export LD_LIBRARY_PATH="${CT2_CORE_BUILD_DIR}${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}"

	"${EPYTHON}" -m build --wheel --no-isolation --outdir "${outdir}" || die
	popd >/dev/null || die
}

src_compile() {
	cmake_src_compile
	use python && python_foreach_impl ctranslate2_python_compile
}

ctranslate2_python_install() {
	local whl_dir="${S}/python/dist-${EPYTHON}"
	local whl=( "${whl_dir}"/*.whl )
	[[ -f ${whl[0]} ]] || die "Wheel not found for ${EPYTHON} (looked in: ${whl_dir})"

	"${EPYTHON}" -m installer --destdir="${D}" "${whl[0]}" || die
}

src_install() {
	cmake_src_install

	# evita collisioni con pacchetti di sistema
	rm -rf "${ED}/usr/include/nlohmann" || die
	rm -rf "${ED}/usr/include/half_float" || die

	use python && python_foreach_impl ctranslate2_python_install
}
