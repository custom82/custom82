# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake flag-o-matic toolchain-funcs xdg git-r3

DESCRIPTION="Peer-to-peer blockchain with assets - Migrated to Qt6 and modern dependencies"
HOMEPAGE="https://ravencoin.org/"
EGIT_REPO_URI="https://github.com/custom82/Ravencoin.git"
EGIT_BRANCH="dev"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="+utils +wallet zmq upnp qrcode qt6 berkdb
      +system-leveldb +system-univalue +system-zerocoin +system-secp256k1 +system-sphlib"

REQUIRED_USE="
    qt6? ( qrcode )
    berkdb? ( wallet )
    system-zerocoin? ( wallet )
"

RDEPEND="
    >=dev-libs/boost-1.88.0:=[threads(+)]
    >=dev-libs/openssl-3.0:=
    >=dev-libs/libevent-2.1:=
    >=dev-libs/libsodium-1.0.18:=
    berkdb? ( >=sys-libs/db-6.0:6.0=[cxx] )
    qrcode? ( >=media-gfx/qrencode-4.1:= )
    system-zerocoin? ( >=dev-libs/libzerocoin-1.0:= )
    system-leveldb? ( >=dev-libs/leveldb-1.23:= )
    system-univalue? ( >=dev-libs/univalue-1.0.5:= )
    system-secp256k1? ( >=dev-libs/libsecp256k1-0.4.0:=[recovery,ecdh,extrakeys,schnorr] )
    system-sphlib? ( >=dev-crypto/sphlib-1.0:= )
    qt6? (
        >=dev-qt/qtbase-6.5:6[gui,network,widgets]
        >=dev-qt/qttools-6.5:6[linguist]
    )
    upnp? ( >=net-libs/miniupnpc-2.2:= )
    zmq? ( >=net-libs/zeromq-4.3:= )
"

DEPEND="${RDEPEND}"

BDEPEND="
    >=dev-build/cmake-3.16
    virtual/pkgconfig
"

src_prepare() {
    cmake_src_prepare

    if use system-leveldb; then
        einfo "Using system LevelDB"
        rm -rf "${S}/src/leveldb" || die "Failed to remove bundled leveldb"
    fi

    if use system-univalue; then
        einfo "Using system UniValue"
        rm -rf "${S}/src/univalue" || die "Failed to remove bundled univalue"
    fi

    if use system-zerocoin; then
        einfo "Using system libzerocoin"
        find "${S}" -type d -name "*zerocoin*" -prune -exec rm -rf {} \; 2>/dev/null || :
        find "${S}" -type f -name "*zerocoin*" -delete 2>/dev/null || :
    fi

    if use system-secp256k1; then
        einfo "Using system libsecp256k1"
        rm -rf "${S}/src/secp256k1" || die "Failed to remove bundled secp256k1"
    fi

    if use system-sphlib; then
        einfo "Using system sphlib"
        rm -rf "${S}/src/crypto/sphlib" || die "Failed to remove bundled sphlib"
        rm -f "${S}/src/algo/sphlib.c" || true
    fi
}

src_configure() {
    local mycmakeargs=(
        -DBUILD_RAVENCOIN_QT=$(usex qt6 ON OFF)
        -DBUILD_RAVENCOIND=$(usex utils ON OFF)
        -DBUILD_RAVENCOIN_CLI=$(usex utils ON OFF)
        -DBUILD_RAVENCOIN_TX=$(usex utils ON OFF)
        -DENABLE_WALLET=$(usex wallet ON OFF)
        -DENABLE_ZMQ=$(usex zmq ON OFF)
        -DENABLE_UPNP=$(usex upnp ON OFF)
        -DUSE_QRCODE=$(usex qrcode ON OFF)
        -DENABLE_TESTS=OFF
        -DENABLE_BENCH=OFF
    )

    if use wallet && ! use berkdb; then
        die "Wallet requires berkdb USE flag"
    fi

    cmake_src_configure
}

src_compile() {
    cmake_src_compile
}

src_install() {
    cmake_src_install
    dodoc README.md CHANGELOG.md

    if use qt6; then
        doicon -s scalable "src/qt/res/icons/raven.svg" 2>/dev/null || :
        doicon -s 256 "src/qt/res/icons/raven256.png" 2>/dev/null || :
        make_desktop_entry "ravencoin-qt" "Ravencoin" raven "Network;P2P;Finance" 2>/dev/null || :
    fi

    if [[ -d "${S}/contrib/bash-completion" ]]; then
        insinto /usr/share/bash-completion/completions
        doins contrib/bash-completion/*.bash 2>/dev/null || :
    fi
}

pkg_postinst() {
    elog ""
    elog "╔══════════════════════════════════════════════════════════════╗"
    elog "║   RAVENCOIN MODERN MIGRATION COMPLETE (QT6)!                ║"
    elog "╚══════════════════════════════════════════════════════════════╝"
    elog ""
    elog "Successfully built with MODERN dependencies:"
    elog ""
    elog "  ✓ CMake 3.16+"
    elog "  ✓ OpenSSL 3.x"
    elog "  ✓ Boost 1.88"
    elog "  ✓ Berkeley DB 6.0"
    elog "  ✓ libsodium"
    elog "  ✓ libevent"

    if use system-leveldb; then
        elog "  ✓ LevelDB (system)"
    fi

    if use system-univalue; then
        elog "  ✓ UniValue (system)"
    fi

    if use system-zerocoin; then
        elog "  ✓ libzerocoin (system)"
    fi

    if use system-secp256k1; then
        elog "  ✓ libsecp256k1 (system)"
    fi

    if use system-sphlib; then
        elog "  ✓ sphlib (system)"
    fi

    if use qt6; then
        elog "  ✓ Qt6"
    fi

    elog ""

    if use wallet; then
        elog "Wallet support is ENABLED with Berkeley DB 6.0"
        elog ""
        elog "Example ~/.ravencoin/raven.conf:"
        elog "  server=1"
        elog "  rpcuser=your_username"
        elog "  rpcpassword=\$(openssl rand -hex 32)"
        elog "  rpcport=8766"
        elog "  port=8767"
        elog "  txindex=1"
        if use system-zerocoin; then
            elog "  enablezeromint=1"
        fi
        elog ""
    fi

    elog "Available binaries:"
    use utils && elog "  • ravencoind    - Daemon"
    use utils && elog "  • ravencoin-cli - CLI interface"
    use utils && elog "  • ravencoin-tx  - Transaction tool"
    use qt6 && elog "  • ravencoin-qt  - Graphical interface (Qt6)"
    elog ""
    elog "For Ravencoin assets: https://ravencoin.org/assets/"
    elog "Report issues: https://github.com/custom82/Ravencoin/issues"
    elog ""
}
