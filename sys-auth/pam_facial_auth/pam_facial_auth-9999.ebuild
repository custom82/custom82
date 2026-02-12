# C  a a opyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=8

inherit cmake git-r3 pam

DESCRIPTION="PAM module for facial authentication using OpenCV"
HOMEPAGE="https://github.com/custom82/pam_facial_auth"
EGIT_REPO_URI="https://github.com/custom82/pam_facial_auth.git"
EGIT_BRANCH="dev"

LICENSE="GPL-3"
SLOT="0"
IUSE="debug"

# OpenCV è obbligatorio. Richiediamo esplicitamente contrib e face tramite USE dependencies.
RDEPEND="
	sys-libs/pam
	>=media-libs/opencv-4.0.0:=[contrib,contribdnn]
"
DEPEND="${RDEPEND}"
BDEPEND="virtual/pkgconfig"

src_configure() {
	local mycmakeargs=(
	-DCMAKE_BUILD_TYPE=$(usex debug Debug Release)
	)
	cmake_src_configure
}

src_install() {

	dopammod "${BUILD_DIR}/pam_facial_auth.so"

	dolib.so "${BUILD_DIR}/libfacialauth.so"

	dosbin "${BUILD_DIR}/facial_capture"
	dosbin "${BUILD_DIR}/facial_training"
	dosbin "${BUILD_DIR}/facial_test"

	doman "${S}"/man/facial_capture.1
	doman "${S}"/man/facial_training.1
	doman "${S}"/man/facial_test.1
	doman "${S}"/man/pam_facial_auth.8

	dopamsecurity pam_facial_auth "${S}/etc/pam_facial.conf" pam_facial.conf

	dodoc "${S}/README.md"
	dodoc "${S}/LICENSE"
}
