# Copyright 1999-2023 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{9..11} )

inherit git-r3 distutils-r1

DESCRIPTION="Paramount Plus 4K Downloader"
HOMEPAGE="https://github.com/weishang9/Paramount-Plus-4k-Downloader"
EGIT_REPO_URI="https://github.com/weishang9/Paramount-Plus-4k-Downloader.git"
EGIT_BRANCH="main"

LICENSE="MIT"
SLOT="0"
KEYWORDS=""
IUSE="test"

DEPEND="
    dev-python/requests[${PYTHON_USEDEP}]
    dev-python/beautifulsoup4[${PYTHON_USEDEP}]
"
RDEPEND="${DEPEND}
    media-video/ffmpeg
"
BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

# Disabilita il supporto PEP 517 se non è necessario
DISTUTILS_USE_PEP517="setuptools"

distutils_enable_tests pytest

python_prepare_all() {
    # Pulisci eventuali file di configurazione problematici
    rm -f pyproject.toml 2>/dev/null || true
    distutils-r1_python_prepare_all
}

python_install_all() {
    distutils-r1_python_install_all
    dodoc README.md
}
