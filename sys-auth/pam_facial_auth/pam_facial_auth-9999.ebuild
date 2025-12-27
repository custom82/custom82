# Copyright 2024-2025 custom82
# Distributed under the terms of the GNU General Public License v3

EAPI=8

# git-r3 for fetching from your repo, pam for specialized PAM functions
inherit cmake git-r3 pam

DESCRIPTION="Universal Facial Authentication PAM module using OpenCL (AMD/NVIDIA/Intel)"
HOMEPAGE="https://github.com/custom82/pam_facial_auth"
EGIT_REPO_URI="https://github.com/custom82/pam_facial_auth.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""

# OpenCV on Gentoo requires contrib and contribdnn for face/dnn modules
IUSE="opencl debug"

RDEPEND="
	media-libs/opencv:=[contrib,contribdnn,opencl?]
	sys-libs/pam
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
	# Install system administration tools to /usr/sbin
	dosbin "${BUILD_DIR}/facial_test"
	dosbin "${BUILD_DIR}/facial_training"
	
	# Install core shared library
	dolib.so "${BUILD_DIR}/libfacialauth.so"

	# Install PAM module using the specialized newpammod function
	# This automatically handles the path (e.g., /lib64/security)
	newpammod "${BUILD_DIR}/pam_facial_auth.so" pam_facial_auth.so

	# Install configuration file
	insinto /etc/security
	newins "${S}/files/pam_facial.conf.example" pam_facial.conf

	# Trained models directory (Resilient: /etc/security)
	diropts -m0750
	keepdir /etc/security/pam_facial_auth

	# Captured datasets directory (Variable data: /var/lib)
	diropts -m0700
	keepdir /var/lib/pam_facial_auth
}

pkg_postinst() {
	elog "Modulo installato con successo."
	elog "I tool di amministrazione sono stati installati in /usr/sbin/"
	elog "Assicurati che OpenCV sia compilato con le flag: contrib, contribdnn e opencl."
	elog "I modelli .onnx vanno inseriti in /etc/security/models/"
}
