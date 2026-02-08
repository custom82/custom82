# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit python-single-r1

DESCRIPTION="Faster Whisper transcription with CTranslate2"
HOMEPAGE="https://github.com/SYSTRAN/faster-whisper"
SRC_URI="https://github.com/SYSTRAN/faster-whisper/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

S="${WORKDIR}/faster-whisper-${PV}"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/av[${PYTHON_SINGLE_USEDEP}]
	sci-libs/ctranslate2[${PYTHON_SINGLE_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_SINGLE_USEDEP}]
	dev-python/onnxruntime[${PYTHON_SINGLE_USEDEP}]
	dev-python/tokenizers[${PYTHON_SINGLE_USEDEP}]
	dev-python/tqdm[${PYTHON_SINGLE_USEDEP}]
"

BDEPEND="
	${PYTHON_DEPS}
	dev-python/build[${PYTHON_SINGLE_USEDEP}]
	dev-python/installer[${PYTHON_SINGLE_USEDEP}]
	dev-python/setuptools[${PYTHON_SINGLE_USEDEP}]
	dev-python/wheel[${PYTHON_SINGLE_USEDEP}]
"

pkg_setup() {
	python-single-r1_pkg_setup
}

src_compile() {
	python -m build --wheel --no-isolation || die
}

src_install() {
	python -m installer --destdir="${D}" dist/*.whl || die
}

