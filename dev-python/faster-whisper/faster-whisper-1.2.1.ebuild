# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Faster Whisper transcription with CTranslate2"
HOMEPAGE="https://github.com/SYSTRAN/faster-whisper"
SRC_URI="https://github.com/SYSTRAN/faster-whisper/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

# Forziamo la scelta di un PYTHON_SINGLE_TARGET perché ctranslate2 è python-single.
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/av[${PYTHON_USEDEP}]
	sci-ml/huggingface_hub[${PYTHON_USEDEP}]
	dev-python/onnxruntime[${PYTHON_USEDEP}]
	dev-python/tokenizers[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		sci-libs/ctranslate2[${PYTHON_SINGLE_USEDEP}]
	')
"

BDEPEND="
	${PYTHON_DEPS}
"

S="${WORKDIR}/faster-whisper-${PV}"
