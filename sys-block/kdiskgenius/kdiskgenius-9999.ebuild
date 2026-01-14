EAPI=8

inherit cmake git-r3

DESCRIPTION="Qt6 UI mock for DiskGenius"
HOMEPAGE="https://github.com/custom82/kdiskgenius"
EGIT_REPO_URI="https://github.com/custom82/kdiskgenius.git"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS=""

DEPEND="dev-qt/qtbase:6[widgets]"
RDEPEND="${DEPEND}"
