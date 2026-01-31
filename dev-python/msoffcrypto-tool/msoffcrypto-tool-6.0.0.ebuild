# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=poetry

inherit pypi distutils-r1

DESCRIPTION="Python tool and library for decrypting and encrypting MS Office files using passwords/keys"
HOMEPAGE="https://github.com/nolze/msoffcrypto-tool"
SRC_URI="$(pypi_sdist_url msoffcrypto-tool ${PV})"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

DEPEND="${RDEPEND}"
RDEPEND="
    dev-python/cryptography[${PYTHON_USEDEP}]
    dev-python/olefile[${PYTHON_USEDEP}]
"

# No tests provided upstream / restrict tests if needed
RESTRICT="test"
