EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit python-r1

DESCRIPTION="Faster Whisper transcription with CTranslate2"
HOMEPAGE="
	https://pypi.org/project/faster-whisper/
	https://github.com/SYSTRAN/faster-whisper
"

SRC_URI="https://files.pythonhosted.org/packages/05/99/49ee85903dee060d9f08297b4a342e5e0bcfca2f027a07b4ee0a38ab13f9/faster_whisper-${PV}-py3-none-any.whl -> ${P}-py3-none-any.whl"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
RESTRICT="test"

S="${WORKDIR}"

IUSE="${PYTHON_TARGETS_IUSE}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/installer:0[${PYTHON_USEDEP}]
	')
"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/av[${PYTHON_USEDEP}]
		dev-python/tqdm[${PYTHON_USEDEP}]
	')
	$(python_gen_cond_dep '
		sci-ml/tokenizers[${PYTHON_USEDEP}]
		dev-python/huggingface-hub[${PYTHON_USEDEP}]
		sci-libs/onnxruntime[${PYTHON_USEDEP}]
		sci-libs/ctranslate2[${PYTHON_USEDEP}]
	')
"

src_unpack() { :; }

src_install() {
	python_foreach_impl _install_wheel
}

_install_wheel() {
	"${EPYTHON}" -m installer \
		--destdir="${D}" \
		--prefix=/usr \
		--compile-bytecode=2 \
		"${DISTDIR}/${A}" || die
}

pkg_postinst() {
	python_foreach_impl python_optimize
}

pkg_postrm() {
	python_foreach_impl python_cleanup
}
