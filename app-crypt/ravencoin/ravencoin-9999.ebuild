# Copyright 2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake git-r3

DESCRIPTION="Ravencoin Core (daemon, CLI, Qt GUI)"
HOMEPAGE="https://ravencoin.org"
EGIT_REPO_URI="https://github.com/custom82/Ravencoin.git"
EGIT_BRANCH="dev"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""

IUSE="gui qrcode upnp wallet zmq"

REQUIRED_USE="
	qrcode? ( gui )
"

BDEPEND="
	virtual/pkgconfig
"

DEPEND="
	dev-libs/boost:=
	dev-libs/libevent:=
	dev-libs/openssl:=
	dev-libs/leveldb:=
	dev-libs/libsecp256k1:=
	dev-libs/univalue:=
	dev-libs/libsph:=
	wallet? ( sys-libs/db:= )
	upnp? ( net-libs/miniupnpc:= )
	zmq? ( net-libs/zeromq:= )
	gui? (
		dev-qt/qtbase:6[gui,widgets,network]
		qrcode? ( media-gfx/qrencode:= )
	)
"

RDEPEND="${DEPEND}
		acct-user/raven
		acct-group/raven"

src_configure() {
	local mycmakeargs=(
		-DBUILD_RAVENCOIND=ON
		-DBUILD_RAVENCOIN_CLI=ON
		-DBUILD_RAVENCOIN_TX=ON
		-DBUILD_RAVENCOIN_QT=$(usex gui)
		-DENABLE_WALLET=$(usex wallet)
		-DENABLE_ZMQ=$(usex zmq)
		-DENABLE_UPNP=$(usex upnp)
		-DUSE_QRCODE=$(usex qrcode)
	)

	cmake_src_configure
}

src_install() {
	cmake_src_install
}

