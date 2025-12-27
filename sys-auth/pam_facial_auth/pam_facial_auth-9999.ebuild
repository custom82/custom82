# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v3

EAPI=8

inherit cmake git-r3

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
    cmake_src_install

    # Installiamo i binari helper (ora garantiti dal CMake)
    dosbin "${BUILD_DIR}/facial_capture"
    dosbin "${BUILD_DIR}/facial_training"
    dosbin "${BUILD_DIR}/facial_test"

    # Directory per i modelli e le catture (permessi restrittivi per sicurezza)
    keepdir /var/lib/pam_facial_auth
    fowners root:root /var/lib/pam_facial_auth
    fperms 0700 /var/lib/pam_facial_auth

    # Configurazione di default
    insinto /etc/security
    newins "${S}/configs/pam_facial_auth.conf.example" pam_facial_auth.conf
}
