# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Faster Whisper transcription using CTranslate2 (optimized Whisper ASR)"
HOMEPAGE="https://github.com/systran/faster-whisper"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm64"
IUSE=""

DEPENDS="
    dev-python/av
    dev-python/ctranslate2
    dev-python/huggingface-hub
    dev-python/onnxruntime
    dev-python/tokenizers
    dev-python/tqdm
"

RDEPEND="${DEPENDS}"
# Nessuna dipendenza di runtime extra oltre a quelle specificate sopra
# non includiamo extras come test o dev

python_install() {
    distutils-r1_python_install
}
