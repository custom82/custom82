# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit git-r3 cmake

DESCRIPTION="A set of cryptographic hash functions (SHA, BLAKE, etc.)"
HOMEPAGE="https://github.com/aidansteele/sphlib"
EGIT_REPO_URI="https://github.com/custom82/sphlib.git"
EGIT_BRANCH="dev"

LICENSE="CC0-1.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE=""

DEPEND=""
RDEPEND=""

src_configure() {
		cmake_src_configure
}

src_compile() {
		cmake_src_compile
}

src_install() {

	dolib.so "${BUILD_DIR}"/libsph.so

	find "${S}"/ -name "*.h" -type f | while read file; do
        # Mantieni la struttura delle directory
        insinto /usr/include/libsph/
        doins "${file}"
    done

	insinto /usr/lib64/pkgconfig
	doins "${FILESDIR}"/libsph.pc
}
