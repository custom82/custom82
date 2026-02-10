EAPI=8

PYTHON_COMPAT=( python3_{10,11,12,13,14} )

DISTUTILS_USE_PEP517=maturin
DISTUTILS_EXT=1

inherit distutils-r1 cargo

DESCRIPTION="Python bindings for Yrs (CRDT) using pyo3/maturin"
HOMEPAGE="https://github.com/y-crdt/pycrdt"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"

CRATES="
	arc-swap-1.8.1
	async-lock-3.4.2
	async-trait-0.1.89
	bitflags-2.10.0
	bumpalo-3.19.1
	cfg-if-1.0.4
	concurrent-queue-2.5.0
	crossbeam-utils-0.8.21
	dashmap-6.1.0
	event-listener-5.4.1
	event-listener-strategy-0.5.4
	fastrand-2.3.0
	getrandom-0.2.17
	hashbrown-0.14.5
	heck-0.5.0
	itoa-1.0.17
	js-sys-0.3.85
	libc-0.2.181
	lock_api-0.4.14
	memchr-2.8.0
	once_cell-1.21.3
	parking-2.2.1
	parking_lot_core-0.9.12
	pin-project-lite-0.2.16
	portable-atomic-1.13.1
	proc-macro2-1.0.106
	pyo3-0.28.0
	pyo3-build-config-0.28.0
	pyo3-ffi-0.28.0
	pyo3-macros-0.28.0
	pyo3-macros-backend-0.28.0
	quote-1.0.41
	r-efi-5.3.0
	redox_syscall-0.5.18
	rustversion-1.0.22
	ryu-1.0.20
	scopeguard-1.2.0
	serde-1.0.220
	serde_core-1.0.220
	serde_derive-1.0.220
	serde_json-1.0.149
	slab-0.4.11
	smallvec-1.15.1
	smallstr-0.3.1
	syn-2.0.104
	target-lexicon-0.13.3
	thiserror-2.0.18
	thiserror-impl-2.0.18
	unicode-ident-1.0.23
	wasi-0.11.1+wasi-snapshot-preview1
	wasm-bindgen-0.2.108
	wasm-bindgen-macro-0.2.108
	wasm-bindgen-macro-support-0.2.108
	wasm-bindgen-shared-0.2.108
	windows-link-0.2.1
	yrs-0.25.0
	zmij-1.0.20
"

SRC_URI="
	https://github.com/y-crdt/pycrdt/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/anyio-4.4.0[${PYTHON_USEDEP}]
	')
	$(python_gen_cond_dep '
		>=dev-python/typing-extensions-4.14.0[${PYTHON_USEDEP}]
		dev-python/exceptiongroup[${PYTHON_USEDEP}]
	' python3_10)
"

BDEPEND="
	>=dev-python/maturin-1.8.2[${PYTHON_USEDEP}]
	virtual/rust
	virtual/cargo
	test? (
		>=dev-python/pytest-8.3.5[${PYTHON_USEDEP}]
		>=dev-python/trio-0.25.1[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.5.2[${PYTHON_USEDEP}]
		>=dev-python/coverage-7[${PYTHON_USEDEP}]
	)
"

S="${WORKDIR}/${P}"

src_unpack() {
	cargo_src_unpack
}

src_prepare() {
	default
}

# cargo.eclass esporta src_compile/src_install: li forziamo a distutils-r1 (maturin)
src_compile() {
	distutils-r1_src_compile
}

python_install() {
	local inst="${BUILD_DIR}/install"
	local pybin
	pybin=$(basename "${EPYTHON}") || die

	# Se gpep517 ha creato symlink che puntano a /usr/bin/*, eliminali.
	# rm NON segue symlink, quindi è safe.
	rm -f \
		"${inst}/usr/bin/${pybin}" \
		"${inst}/usr/bin/python3" \
		"${inst}/usr/bin/python" \
		"${inst}/usr/pyvenv.cfg" || die

	# Assicura che le directory siano reali (non symlink)
	[[ -L ${inst}/usr ]] && rm -f "${inst}/usr" || true
	mkdir -p "${inst}/usr" || die
	[[ -L ${inst}/usr/bin ]] && rm -f "${inst}/usr/bin" || true
	mkdir -p "${inst}/usr/bin" || die

	# Ora crea file regolari nello staging (non symlink)
	: > "${inst}/usr/bin/${pybin}" || die
	: > "${inst}/usr/bin/python3" || die
	: > "${inst}/usr/bin/python" || die
	: > "${inst}/usr/pyvenv.cfg" || die

	distutils-r1_python_install
}


src_install() {
	distutils-r1_src_install
}

distutils_enable_tests pytest
