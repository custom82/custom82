# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1 pypi

DESCRIPTION="Python API to retrieve YouTube transcripts/subtitles (incl. auto-generated), without a headless browser"
HOMEPAGE="https://github.com/jdepoix/youtube-transcript-api"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# upstream ha test che spesso richiedono rete/YouTube; ok tenerli disabilitati
RESTRICT="test"

RDEPEND="
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/defusedxml[${PYTHON_USEDEP}]
"
BDEPEND="
	${RDEPEND}
	dev-python/poetry-core[${PYTHON_USEDEP}]
"
