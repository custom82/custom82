# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10,11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Pythonic bindings for FFmpeg's libraries (PyAV)"
HOMEPAGE="
	https://pypi.org/project/av/
	https://github.com/PyAV-Org/PyAV
"
LICENSE="BSD-3-Clause"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"

# Build-time deps:
# - PyAV usa pkg-config per trovare libav* (FFmpeg dev) :contentReference[oaicite:1]{index=1}
# - spesso serve Cython per generare le estensioni a partire dai .pyx
BDEPEND="
	virtual/pkgconfig
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/cython[${PYTHON_USEDEP}]
"

# Runtime/compile deps: serve FFmpeg (headers + libs) presenti a sistema
RDEPEND="
	media-video/ffmpeg:=
"
DEPEND="${RDEPEND}"

