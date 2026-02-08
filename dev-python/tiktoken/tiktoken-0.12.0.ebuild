EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools
DISTUTILS_EXT=1

inherit cargo distutils-r1

DESCRIPTION="Fast BPE tokenizer for OpenAI models"
HOMEPAGE="https://github.com/openai/tiktoken"

CRATES="
	aho-corasick-1.1.3
	autocfg-1.3.0
	bit-set-0.5.3
	bit-vec-0.6.3
	bstr-1.5.0
	fancy-regex-0.13.0
	heck-0.5.0
	indoc-2.0.5
	libc-0.2.159
	memchr-2.7.4
	memoffset-0.9.1
	once_cell-1.19.0
	once_cell-1.21.0
	portable-atomic-1.10.0
	proc-macro2-1.0.86
	pyo3-0.26.0
	pyo3-build-config-0.26.0
	pyo3-ffi-0.26.0
	pyo3-macros-0.26.0
	pyo3-macros-backend-0.26.0
	quote-1.0.37
	regex-1.10.3
	regex-automata-0.1.10
	regex-automata-0.4.7
	regex-syntax-0.8.4
	rustc-hash-2.0.0
	serde-1.0.203
	serde_derive-1.0.203
	syn-2.0.77
	target-lexicon-0.13.2
	unicode-ident-1.0.12
	unindent-0.2.3
"

SRC_URI="
	https://github.com/openai/tiktoken/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/${PN}-${PV}"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/regex[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

BDEPEND="
	>=dev-python/setuptools-rust-1.7.0[${PYTHON_USEDEP}]
	|| ( dev-lang/rust dev-lang/rust-bin )
"

src_unpack() {
	default
	cargo_src_unpack
}

src_prepare() {
	distutils-r1_src_prepare

	# Genera .cargo/config.toml per usare i crate scaricati (vendoring) in offline
	cargo_gen_config
}

# Helper: forza build rust offline usando la config di cargo.eclass
python_compile() {
	export CARGO_NET_OFFLINE=true
	export CARGO_HOME="${ECARGO_HOME}"
	distutils-r1_python_compile
}

python_install() {
	export CARGO_NET_OFFLINE=true
	export CARGO_HOME="${ECARGO_HOME}"
	distutils-r1_python_install
}
