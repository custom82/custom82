EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=maturin

inherit distutils-r1 cargo

# Genera con pycargoebuild (vedi sotto)
CRATES="
        ahash-0.8.0
        bitvec-1.0.1
        lexical-parse-float-1.0.5
        num-bigint-0.4.4
        num-traits-0.2.16
        pyo3-0.28.0
        pyo3-build-config-0.28.0
        smallvec-1.11.0
        codspeed-criterion-compat-2.7.2
        paste-1.0.7
        serde-1.0.194
        serde_derive-1.0.194
        serde_json-1.0.120
        indexmap-2.0.0
        libfuzzer-sys-0.4.7
        num-traits-0.2.17
        cfg-if-1.0.0
        getrandom-0.2.15
        version_check-0.9.4
        once_cell-1.19.0
        once_cell-1.21.0
        funty-2.0.0
        radium-0.7.0
        tap-1.0.1
        wyz-0.5.1
        lexical-parse-integer-1.0.5
        lexical-util-1.0.5
        static_assertions-1.1.0
        num-integer-0.1.45
        autocfg-1.3.0
        libc-0.2.159
        pyo3-ffi-0.28.0
        pyo3-macros-0.28.0
        pyo3-macros-backend-0.28.0
        portable-atomic-1.10.0
        codspeed-2.7.2
        colored-2.1.0
        criterion-0.5.1
        serde_derive-1.0.190
        itoa-1.0.11
        ryu-1.0.17
        target-lexicon-0.13.3
        equivalent-1.0.1
        hashbrown-0.14.0
        arbitrary-1.3.2
        cc-1.0.99
        wasi-0.11.0+wasi-snapshot-preview1
        proc-macro2-1.0.86
        quote-1.0.37
        syn-2.0.77
        unicode-ident-1.0.12
        indexmap-2.2.3
        lazy_static-1.4.0
        anes-0.1.6
        cast-0.3.0
        ciborium-0.2.2
        clap-4.5.4
        criterion-plot-0.5.0
        is-terminal-0.4.12
        itertools-0.10.5
        oorandom-11.1.3
        plotters-0.3.5
        rayon-1.10.0
        regex-1.10.4
        tinytemplate-1.2.1
        walkdir-2.5.0
        hashbrown-0.14.1
        jobserver-0.1.31
        heck-0.5.0
        ciborium-io-0.2.2
        ciborium-ll-0.2.2
        clap_builder-4.5.2
        clap_lex-0.7.0
        hermit-abi-0.3.9
        windows-sys-0.48.0
        windows-targets-0.48.5
        windows-sys-0.52.0
        windows-targets-0.52.0
        either-1.13.0
        plotters-backend-0.3.5
        plotters-svg-0.3.5
        wasm-bindgen-0.2.91
        web-sys-0.3.68
        rayon-core-1.12.1
        aho-corasick-1.1.3
        memchr-2.7.4
        regex-automata-0.4.6
        regex-syntax-0.8.3
        same-file-1.0.6
        winapi-util-0.1.6
        python3-dll-a-0.2.12
        windows_aarch64_gnullvm-0.48.5
        windows_aarch64_msvc-0.48.5
        windows_i686_gnu-0.48.5
        windows_i686_msvc-0.48.5
        windows_x86_64_gnu-0.48.5
        windows_x86_64_msvc-0.48.5
        windows_x86_64_gnullvm-0.48.5
        half-2.4.1
        anstyle-1.0.6
        wasm-bindgen-0.2.91
        wasm-bindgen-macro-0.2.91
        js-sys-0.3.68
        crossbeam-deque-0.8.5
        crossbeam-utils-0.8.20
        winapi-0.3.9
        crunchy-0.2.2
        windows-sys-0.52.0
        windows-targets-0.52.0
        windows_aarch64_gnullvm-0.52.0
        windows_aarch64_msvc-0.52.0
        windows_i686_gnu-0.52.0
        windows_i686_msvc-0.52.0
        windows_x86_64_gnu-0.52.0
        windows_x86_64_gnullvm-0.52.0
        windows_x86_64_msvc-0.52.0
        wasm-bindgen-macro-support-0.2.91
        crossbeam-epoch-0.9.18
        winapi-i686-pc-windows-gnu-0.4.0
        winapi-x86_64-pc-windows-gnu-0.4.0
        wasm-bindgen-backend-0.2.91
        wasm-bindgen-shared-0.2.91
        bumpalo-3.14.0
        log-0.4.21
"

DESCRIPTION="Fast iterable JSON parser"
HOMEPAGE="https://github.com/pydantic/jiter"
SRC_URI="
	https://github.com/pydantic/jiter/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"
RESTRICT="!test? ( test )"



BDEPEND="
	virtual/rust
	dev-util/maturin
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"

JITER_ROOT="${WORKDIR}/jiter-${PV}"
S="${JITER_ROOT}/crates/jiter-python"

src_unpack() {
	cargo_src_unpack   # scompatta e prepara vendor crates
}

src_prepare() {
	distutils-r1_src_prepare

	# se ti serve ancora la patch alle features, ora usa ${S}
	sed -i \
		-e 's/"pyo3\/generate-import-lib"/"pyo3\/generate-import-lib", "python"/' \
		"${S}/pyproject.toml" || die
}

python_test() {
	epytest
}
