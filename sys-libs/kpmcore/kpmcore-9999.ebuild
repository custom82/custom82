# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

ECM_NONGUI="true"
KFMIN=6.19.0
QTMIN=6.9.1
inherit ecm gear.kde.org git-r3

DESCRIPTION="Library for managing partitions"
HOMEPAGE="https://apps.kde.org/partitionmanager/"
EGIT_REPO_URI="https://github.com/custom82/kpmcore.git"
EGIT_BRANCH="dev"

LICENSE="GPL-3"
SLOT="6/10"
IUSE=""

# bug 689468, tests need polkit etc.
RESTRICT="test"

DEPEND="
	>=dev-qt/qtbase-${QTMIN}:6[dbus,gui,widgets]
	>=kde-frameworks/kcoreaddons-${KFMIN}:6
	>=kde-frameworks/ki18n-${KFMIN}:6
	>=kde-frameworks/kwidgetsaddons-${KFMIN}:6
	>=sys-apps/util-linux-2.33.2
	>=sys-auth/polkit-qt-0.175.0[qt6(+)]
"
RDEPEND="${DEPEND}"
BDEPEND="virtual/pkgconfig"
