EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit cmake python-r1

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

IUSE="cli openmp test"
RESTRICT="!test? ( test )"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"

DEPEND="
	dev-libs/cpuinfo
	dev-cpp/eigen
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"

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

	# Patch: alla fine del prepare (dopo aver vendorizzato i third_party)
	eapply "${FILESDIR}/ctranslate-gcc15-fix.patch"
}

src_configure() {
	python_setup

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
