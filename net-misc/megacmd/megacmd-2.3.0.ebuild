# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit bash-completion-r1 flag-o-matic cmake
MY_PN="MEGAcmd"
MEGA_SDK_REV="337dbd59d7dbfb901a37abecc3939394827d1a04"
SRC_URI="
			https://github.com/meganz/MEGAcmd/archive/refs/tags/2.3.0_Win.tar.gz -> ${P}.tar.gz
			https://github.com/meganz/sdk/archive/${MEGA_SDK_REV}.tar.gz -> ${PN}-sdk-${PV}.tar.gz
"
KEYWORDS="~amd64"
S="${WORKDIR}/${MY_PN}-${PV}_Win"

DESCRIPTION="Command Line Interactive and Scriptable Application to access MEGA"
HOMEPAGE="https://mega.nz/cmd"

LICENSE="BSD-2"
SLOT="0"
IUSE="pcre"

DEPEND="
	pcre? ( dev-libs/libpcre:3[cxx] )
	sys-libs/readline:=
	dev-libs/crypto++:=
	net-misc/curl:=
	dev-libs/icu:=
	dev-libs/libsodium:=
	dev-libs/libuv:=
	dev-libs/openssl:=
	dev-db/sqlite:=
	virtual/zlib:=
	media-video/ffmpeg:=
	sys-fs/fuse:=
"
RDEPEND="
	${DEPEND}
"

PATCHES=(
	"${FILESDIR}"/${PN}-link-zlib.patch
	"${FILESDIR}"/${PN}-fix-prefix.patch
	"${FILESDIR}"/${PN}-fix-cryptopp.patch
	"${FILESDIR}"/${PN}-disable-vcpkg.patch
	"${FILESDIR}"/${PN}-disable-clone-vcpkg.patch
	"${FILESDIR}"/${PN}-add-pcre-zlib-link.patch
)


src_prepare() {
	rmdir sdk || die
	mv "${WORKDIR}/sdk-${MEGA_SDK_REV}" "${S}"/sdk || die
	cmake_src_prepare
}

src_configure() {
	append-cppflags -DNDEBUG
	local mycmakeargs=(
		-DUSE_PCRE=$(usex pcre)
		-DFULL_REQS=no
		-DBUILD_SHARED_LIBS=OFF
		-DCMAKE_BUILD_TYPE=RelWithDebInfo # None does not work: https://github.com/meganz/sdk/issues/2679
		-DUSE_FREEIMAGE=no
	    -DUSE_PDFIUM=no
    	-DFULL_REQS=off
		#-DCMAKE_INSTALL_LIBDIR="/usr/lib64"
		#-DCMAKE_BINARY_DIR="/usr/bin"
		-DCMAKE_INSTALL_SYSCONFDIR="/etc"
		#-DCMAKE_INSTALL_LIBDIR="/usr/lib64"
	)
	cmake_src_configure
}

src_install() {
	cmake_src_install
	#newbashcomp src/client/megacmd_completion.sh ${PN}
	#insinto /etc/sysctl.d
	#doins "${BUILD_DIR}"/99-megacmd-inotify-limit.conf
}
