EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit cmake python-single-r1

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
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
	python? (
		${PYTHON_DEPS}
		dev-python/build[${PYTHON_SINGLE_USEDEP}]
		dev-python/installer[${PYTHON_SINGLE_USEDEP}]
		dev-python/pybind11[${PYTHON_SINGLE_USEDEP}]
		dev-python/setuptools[${PYTHON_SINGLE_USEDEP}]
		dev-python/wheel[${PYTHON_SINGLE_USEDEP}]
	)
"

# evita problemi di maiuscole/minuscole (nel tuo log è ctranslate2-4.7.1)
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

	# Patch alla fine del prepare
	eapply "${FILESDIR}/ctranslate-gcc15-fix.patch"
	eapply "${FILESDIR}/ctranslate2-4.7.1-unpin-pybind11.patch"
}

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
		-DCMAKE_BUILD_TYPE=Release
		-DCMAKE_POSITION_INDEPENDENT_CODE=ON
		-DTHREADS_PREFER_PTHREAD_FLAG=ON

		-DWITH_OPENMP="$(usex openmp ON OFF)"
		-DOPENMP_RUNTIME="$(usex openmp COMP NONE)"
		-DWITH_MKL=OFF

		-DBUILD_CLI="$(usex cli ON OFF)"
		-DBUILD_TESTS="$(usex test ON OFF)"
	)
	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	if use python; then
		python-single-r1_python_setup

		(
			cd python || die

			append-cppflags "-I${S}/include"
			append-cxxflags "-I${S}/include"
			append-ldflags "-L${BUILD_DIR}"

			"${EPYTHON}" -m build --wheel --no-isolation || die
		)
	fi
}



src_install() {
	cmake_src_install

	if use python; then
		python-single-r1_python_setup

		local whl
		whl=$(echo "${S}/python/dist/"*.whl)
		[[ -f ${whl} ]] || die "Wheel not found in ${S}/python/dist (got: ${whl})"

		"${EPYTHON}" -m installer --destdir="${D}" "${whl}" || die
	fi
}
