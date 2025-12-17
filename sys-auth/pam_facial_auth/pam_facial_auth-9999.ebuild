# Copyright
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake pam git-r3

DESCRIPTION="PAM facial authentication module with OpenCV DNN (YuNet/SFace/LBPH/Eigen/Fisher)"
HOMEPAGE="https://github.com/custom82/pam_facial_auth"
EGIT_REPO_URI="https://github.com/custom82/pam_facial_auth.git"
EGIT_BRANCH="dev"

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
        -DENABLE_CUDA=$(usex cuda ON OFF)
        -DENABLE_OPENCL=$(usex opencl ON OFF)
        -DCMAKE_INSTALL_PREFIX=/usr
	)

	cmake_src_configure
}

# ============================================================
# INSTALLAZIONE
# ============================================================

src_install() {

	insinto /lib64/security
	doins "${BUILD_DIR}/pam_facial_auth.so"
	fperms 0755 /lib64/security/pam_facial_auth.so

	dolib.so "${BUILD_DIR}/libfacialauth.so"

	dosbin "${BUILD_DIR}/facial_capture"
	dosbin "${BUILD_DIR}/facial_training"
	dosbin "${BUILD_DIR}/facial_test"

	doman man/facial_capture.1
	doman man/facial_training.1
	doman man/facial_test.1
	doman man/pam_facial_auth.8

	insinto /etc/security
	doins "${S}/etc/pam_facial.conf" || die

	dodoc "${S}/README.md"
	dodoc "${S}/LICENSE"
}

pkg_postinst() {
	elog "PAM Facial Auth installed."
	elog "Configuration file: /etc/security/pam_facial.conf"
	elog "Add to /etc/pam.d/system-auth or login:"
	elog "    auth sufficient pam_facial_auth.so"
}

