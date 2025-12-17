# Copyright
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake pam git-r3

DESCRIPTION="PAM facial authentication module with OpenCV DNN (YuNet/SFace/LBPH/Eigen/Fisher)"
HOMEPAGE="https://github.com/custom82/pam_facial_auth"
SRC_URI="https://github.com/custom82/pam_facial_auth/archive/refs/tags/pam_facial_auth-1.0.tar.gz"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64"

IUSE="cuda opencl"

# ============================================================
# DEPENDENZE
# ============================================================

# OpenCV deve avere:
#  - contrib + contribdnn
#  - face
#  - videoio
#
# Ogni backend viene abilitato tramite USE separata
#

RDEPEND="
	media-libs/opencv:=[contrib,contribdnn]
	media-libs/libv4l

	cuda? (
		media-libs/opencv[cuda]
		dev-util/nvidia-cuda-toolkit
	)

	opencl? (
		media-libs/opencv[opencl]
	virtual/opencl
	)

	sys-libs/pam
"

DEPEND="${RDEPEND}
	virtual/pkgconfig
"
BDEPEND=""

# ============================================================
# CONFIGURAZIONE CMake
# ============================================================

src_configure() {
	local mycmakeargs=(
        -DCMAKE_INSTALL_PREFIX=/usr
	)

	cmake_src_configure
}

# ============================================================
# INSTALLAZIONE
# ============================================================

src_install() {

	dopammod "${BUILD_DIR}/pam_facial_auth.so"

	dolib.so "${BUILD_DIR}/libfacialauth.so"

	dosbin "${BUILD_DIR}/facial_capture"
	dosbin "${BUILD_DIR}/facial_training"
	dosbin "${BUILD_DIR}/facial_test"

	doman man/facial_capture.1
	doman man/facial_training.1
	doman man/facial_test.1
	doman man/pam_facial_auth.8

	dopamsecurity "${S}/etc/pam_facial.conf" 

	dodoc "${S}/README.md"
	dodoc "${S}/LICENSE"
}

pkg_postinst() {
	elog "PAM Facial Auth installed."
	elog "Configuration file: /etc/security/pam_facial.conf"
	elog "Add to /etc/pam.d/system-auth or login:"
	elog "    auth sufficient pam_facial_auth.so"
}

