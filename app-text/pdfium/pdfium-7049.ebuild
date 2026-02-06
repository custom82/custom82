EAPI=8

DESCRIPTION="Library for PDF rendering, inspection, manipulation and creation (PDFium)"
HOMEPAGE="https://pdfium.googlesource.com/pdfium"

PDFIUM_BUILD="7049"
CHROMIUM_TAG="135.0.7049.0"

BUILD_REVISION="3dd73ffc3708962da298795d99f35fc06ed0defc"
ABSEIL_REVISION="221ee3ed3b032d5a82736613440664f9fbe4d3db"
FAST_FLOAT_REVISION="cb1d42aaa1e14b09e1452cfdef373d051b8c02a4"
GTEST_REVISION="e235eb34c6c4fed790ccdad4b16394301360dcd4"
TEST_FONTS_REVISION="7f51783942943e965cd56facf786544ccfc07713"

SRC_URI="
	https://pdfium.googlesource.com/pdfium/+archive/refs/heads/chromium/7049.tar.gz -> ${P}.tar.gz
	https://chromium.googlesource.com/chromium/src/build.git/+archive/${BUILD_REVISION}.tar.gz -> build-${BUILD_REVISION}.tar.gz
	https://chromium.googlesource.com/chromium/src/third_party/abseil-cpp/+archive/${ABSEIL_REVISION}.tar.gz -> abseil-cpp-${ABSEIL_REVISION}.tar.gz
	https://chromium.googlesource.com/external/github.com/fastfloat/fast_float.git/+archive/${FAST_FLOAT_REVISION}.tar.gz -> fast_float-${FAST_FLOAT_REVISION}.tar.gz
	https://chromium.googlesource.com/external/github.com/google/googletest.git/+archive/${GTEST_REVISION}.tar.gz -> gtest-${GTEST_REVISION}.tar.gz
	https://chromium.googlesource.com/chromium/src/third_party/test_fonts.git/+archive/${TEST_FONTS_REVISION}.tar.gz -> test_fonts-${TEST_FONTS_REVISION}.tar.gz
	https://chromium.googlesource.com/chromium/src/+archive/refs/tags/${CHROMIUM_TAG}/tools/generate_shim_headers.tar.gz -> generate_shim_headers-${CHROMIUM_TAG}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="test"
RESTRICT="!test? ( test )"

BDEPEND="
	dev-util/gn
	dev-util/ninja
	sys-apps/chrpath
	virtual/pkgconfig
"
RDEPEND="
	dev-libs/glib:2
	media-libs/freetype:2
	dev-libs/icu:=
	media-libs/lcms:2
	media-libs/jpeg:0
	media-libs/openjpeg:2
	media-libs/libpng:0
	media-libs/tiff:0
	sys-libs/zlib
"
DEPEND="${RDEPEND}"

PATCHES=(
	"${FILESDIR}/0001-bigendian.patch"
	"${FILESDIR}/0002-openjpeg-2.4.patch"
)

S="${WORKDIR}/${PN}-${PV}"

src_unpack() {
	mkdir -p "${S}" || die
	cd "${S}" || die
	unpack "${P}.tar.gz"

	mkdir -p "${S}/build" || die
	cd "${S}/build" || die
	unpack "build-${BUILD_REVISION}.tar.gz"

	mkdir -p "${S}/third_party/abseil-cpp" || die
	cd "${S}/third_party/abseil-cpp" || die
	unpack "abseil-cpp-${ABSEIL_REVISION}.tar.gz"

	mkdir -p "${S}/third_party/fast_float/src" || die
	cd "${S}/third_party/fast_float/src" || die
	unpack "fast_float-${FAST_FLOAT_REVISION}.tar.gz"

	mkdir -p "${S}/third_party/googletest/src" || die
	cd "${S}/third_party/googletest/src" || die
	unpack "gtest-${GTEST_REVISION}.tar.gz"

	mkdir -p "${S}/third_party/test_fonts" || die
	cd "${S}/third_party/test_fonts" || die
	unpack "test_fonts-${TEST_FONTS_REVISION}.tar.gz"

	mkdir -p "${S}/tools/generate_shim_headers" || die
	cd "${S}/tools/generate_shim_headers" || die
	unpack "generate_shim_headers-${CHROMIUM_TAG}.tar.gz"
}

src_prepare() {
	default

	# Use relative paths in public/cpp headers
	sed -i 's/"public\//"..\//g' public/cpp/*.h || die

	# Unbundle ICU
	mkdir -p third_party/icu || die
	cp build/linux/unbundle/icu.gn third_party/icu/BUILD.gn || die

	# Build static abseil-cpp
	sed -i 's/component("absl")/static_library("absl")/g' third_party/abseil-cpp/BUILD.gn || die

	# Empty gclient config
	mkdir -p build/config || die
	: > build/config/gclient_args.gni || die

	# Don't build test fonts, but keep fonts for embedded tests
	sed -i '/third_party\/test_fonts/d' testing/BUILD.gn || die

	# Workaround for 'Undefined identifier'
	sed -i 's/use_remoteexec/false/g' build/config/linux/pkg_config.gni || die

	# GCC passflags toolchain
	mkdir -p build/toolchain/linux/passflags || die
	cp "${FILESDIR}/passflags-BUILD.gn" build/toolchain/linux/passflags/BUILD.gn || die
}

src_configure() {
	mkdir -p out/release || die
	cp "${FILESDIR}/args.gn" out/release/args.gn || die

	# FMA/fp-contract workaround from spec
	append-cppflags -ffp-contract=off

	gn gen out/release || die "gn gen failed"
}

src_compile() {
	if use test; then
		ninja -C out/release pdfium pdfium_unittests || die
	else
		ninja -C out/release pdfium || die
	fi

	chrpath --delete out/release/libpdfium.so || die
}

src_test() {
	GTEST_FILTER="*"
	GTEST_FILTER="${GTEST_FILTER}" out/release/pdfium_unittests || die
}

src_install() {
	dolib.so out/release/libpdfium.so

	insinto /usr/include/pdfium
	doins public/*.h
	insinto /usr/include/pdfium/cpp
	doins public/cpp/*.h

	insinto /usr/$(get_libdir)/pkgconfig
	cat > "${T}/libpdfium.pc" <<-EOF || die
	prefix=/usr
	exec_prefix=\${prefix}
	libdir=/usr/$(get_libdir)
	includedir=\${prefix}/include

	Name: libpdfium
	Description: Library for PDF rendering, inspection, manipulation and creation
	Version: ${PV}
	Cflags: -I\${includedir}
	Requires.private: freetype2 icu-uc libjpeg lcms2 libopenjp2 zlib
	Libs: -L\${libdir} -lpdfium
	EOF
	doins "${T}/libpdfium.pc"

	dodoc AUTHORS README.md out/release/args.gn
	dolicense LICENSE
}
