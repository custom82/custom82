# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# Copyright 1999-2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Utility per testare i moduli PAM dalla riga di comando"
HOMEPAGE="https://github.com/pamtester/pamtester"
SRC_URI="https://sourceforge.net/projects/pamtester/files/pamtester/0.1.2/pamtester-0.1.2.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="nls"

DEPEND="
	sys-libs/pam
	nls? ( sys-devel/gettext )
"
RDEPEND="${DEPEND}"
BDEPEND="
	virtual/pkgconfig
"

src_configure() {
	econf \
		$(use_enable nls)
}

src_compile() {
	default
}

src_install() {
	default
	dodoc AUTHORS ChangeLog NEWS README
}

src_test() {
	# pamtester richiede PAM configurato, quindi i test vengono saltati
	ewarn "Skipping tests since PAM interaction requires root privileges"
}

