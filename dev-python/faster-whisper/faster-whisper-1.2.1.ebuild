EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Faster Whisper transcription with CTranslate2"
HOMEPAGE="https://github.com/SYSTRAN/faster-whisper"
SRC_URI="
	https://github.com/SYSTRAN/faster-whisper/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	sci-libs/ctranslate2
	>=sci-ml/tokenizers-0.15.0[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		>=dev-python/av-10.0.0[${PYTHON_USEDEP}]
		>=dev-python/cffi-1.15.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.65.0[${PYTHON_USEDEP}]
		>=dev-python/onnxruntime-1.23.2[${PYTHON_USEDEP}]
	')
"
DEPEND="${RDEPEND}"

# tipicamente i test usano pytest; se upstream non li include davvero,
# al massimo disabilitali o metti RESTRICT mirato.
distutils_enable_tests pytest
