# Copyright 1999-2024 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=hatchling
DISTUTILS_EXT=1

inherit distutils-r1

DESCRIPTION="Download Spotify playlists from YouTube with album art and metadata"
HOMEPAGE="https://github.com/spotDL/spotify-downloader"
SRC_URI="https://github.com/spotDL/spotify-downloader/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=dev-python/spotipy-2.23.0[${PYTHON_USEDEP}]
	>=net-misc/yt-dlp-2024.4.9[${PYTHON_USEDEP}]
	>=dev-python/rich-13.7.0[${PYTHON_USEDEP}]
	>=dev-python/rapidfuzz-3.8.1[${PYTHON_USEDEP}]
	>=media-libs/mutagen-1.47.0[${PYTHON_USEDEP}]
	>=dev-python/beautifulsoup4-4.12.2[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31.0[${PYTHON_USEDEP}]
	>=dev-python/pydes-0.1.1[${PYTHON_USEDEP}]
	>=dev-python/pydub-0.25.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
	>=dev-python/urllib3-2.0.7[${PYTHON_USEDEP}]
	>=dev-python/syncedlyrics-0.5.0[${PYTHON_USEDEP}]
	>=dev-python/unidecode-1.3.8[${PYTHON_USEDEP}]
	>=dev-python/ffmpeg-python-0.2.0[${PYTHON_USEDEP}]
	>=dev-python/click-8.1.7[${PYTHON_USEDEP}]
	>=dev-python/pytube-15.0.0[${PYTHON_USEDEP}]
	media-video/ffmpeg
"

BDEPEND="
    ${RDEPEND}
    dev-python/hatchling[${PYTHON_USEDEP}]
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
        dev-python/pytest-mock[${PYTHON_USEDEP}]
        dev-python/pytest-asyncio[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest

src_prepare() {
    # Rimuovi le dipendenze di test dai requirements se presenti
    if [[ -f requirements.txt ]]; then
        sed -i -e '/pytest/d' requirements.txt || die
    fi
    distutils-r1_src_prepare
}
