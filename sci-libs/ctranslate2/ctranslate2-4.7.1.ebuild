EAPI=8

inherit cmake

DESCRIPTION="Fast inference engine for Transformer models (OpenNMT)"
HOMEPAGE="https://github.com/OpenNMT/CTranslate2"

# Il tarball del progetto non include i submodule (third_party/spdlog e cpu_features).
# Quindi li scarichiamo separatamente e li "vendorizziamo" in src_prepare().
SRC_URI="
  https://github.com/OpenNMT/CTranslate2/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
  https://github.com/gabime/spdlog/archive/refs/tags/v1.14.1.tar.gz -> spdlog-1.14.1.tar.gz
  https://github.com/google/cpu_features/archive/refs/tags/v0.9.0.tar.gz -> cpu_features-0.9.0.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="cli openmp test"
RESTRICT="!test? ( test )"

DEPEND="
  dev-libs/cpuinfo
  dev-cpp/eigen
"
RDEPEND="${DEPEND}"
BDEPEND="
  virtual/pkgconfig
"

S="${WORKDIR}/CTranslate2-${PV}"

src_prepare() {
  cmake_src_prepare

  # Popola i submodule mancanti nel tarball release.
  rm -rf third_party/spdlog third_party/cpu_features || die
  mkdir -p third_party || die

  # I tarball estraggono directory tipo spdlog-1.14.1/ e cpu_features-0.9.0/
  cp -a "${WORKDIR}/spdlog-1.14.1" third_party/spdlog || die
  cp -a "${WORKDIR}/cpu_features-0.9.0" third_party/cpu_features || die
}

src_configure() {
  local mycmakeargs=(
    -DBUILD_SHARED_LIBS=ON
    -DCMAKE_BUILD_TYPE=Release
    -DCMAKE_POSITION_INDEPENDENT_CODE=ON

    # IMPORTANTISSIMO: evita /usr/lib64/libpthread.a dentro .so
    -DTHREADS_PREFER_PTHREAD_FLAG=ON

    -DWITH_OPENMP=$(usex openmp ON OFF)
    -DOPENMP_RUNTIME=$(usex openmp COMP NONE)
    -DWITH_MKL=OFF

    -DBUILD_CLI=$(usex cli ON OFF)
    -DBUILD_TESTS=$(usex test ON OFF)
  )

  cmake_src_configure
}
