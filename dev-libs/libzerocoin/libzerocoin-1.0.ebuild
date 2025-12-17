# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Zerocoin Cryptographic Library - Secure Anonymous Digital Cash"
HOMEPAGE="https://github.com/custom82/libzerocoin"
SRC_URI="https://github.com/custom82/libzerocoin/archive/refs/tags/v1.0.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

RDEPEND="
	>=dev-libs/openssl-3.0:=
	>=dev-libs/boost-1.75:=
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

RESTRICT="!test? ( test )"

src_configure() {
	local mycmakeargs=(
		-DBUILD_SHARED_LIBS=ON
	)
	cmake_src_configure
}

src_install() {
	dolib.so "${BUILD_DIR}"/libzerocoin.so.1.0.0
	insinto /usr/$(get_libdir)
	doins "${BUILD_DIR}"/libzerocoin.so.1
	doins "${BUILD_DIR}"/libzerocoin.so


	# Install pkgconfig file
	insinto /usr/$(get_libdir)/pkgconfig
	newins "${S}"/libzerocoin.pc.in libzerocoin.pc

	doheader "${S}"/include/libzerocoin.h
}

pkg_postinst() {
	elog "libzerocoin ${PV} has been successfully installed."
	elog "This release includes SHA-512 enhancements and OpenSSL 3.x compatibility."
}
