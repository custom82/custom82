# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi cargo

DESCRIPTION="CRDTs based on Yrs."
HOMEPAGE="https://github.com/y-crdt/pycrdt"

CRATES="
serde_json-1.0.145
yrs-0.25.0
pyo3-0.27.2
indoc-2.0.7
libc-0.2.178
memoffset-0.9.1
once_cell-1.21.3
pyo3-ffi-0.27.2
pyo3-macros-0.27.2
unindent-0.2.4
pyo3-build-config-0.27.2
portable-atomic-1.11.1
itoa-1.0.15
memchr-2.7.6
ryu-1.0.20
serde_core-1.0.228
serde-1.0.228
arc-swap-1.7.1
async-lock-3.4.1
async-trait-0.1.89
dashmap-6.1.0
fastrand-2.3.0
smallstr-0.3.1
smallvec-1.15.1
thiserror-2.0.17
rustversion-1.0.22
autocfg-1.5.0
proc-macro2-1.0.103
pyo3-macros-backend-0.27.2
quote-1.0.42
syn-2.0.111
target-lexicon-0.13.3
serde_derive-1.0.228
event-listener-5.4.1
event-listener-strategy-0.5.4
pin-project-lite-0.2.16
cfg-if-1.0.4
crossbeam-utils-0.8.21
hashbrown-0.14.5
lock_api-0.4.14
parking_lot_core-0.9.12
getrandom-0.2.16
thiserror-impl-2.0.17
unicode-ident-1.0.22
heck-0.5.0
concurrent-queue-2.5.0
parking-2.2.1
scopeguard-1.2.0
redox_syscall-0.5.18
windows-link-0.2.1
js-sys-0.3.83
wasm-bindgen-0.2.106
wasi-0.11.1+wasi-snapshot-preview1
bitflags-2.10.0
wasm-bindgen-macro-0.2.106
wasm-bindgen-shared-0.2.106
wasm-bindgen-macro-support-0.2.106
bumpalo-3.19.0
"

SRC_URI="
		https://github.com/y-crdt/pycrdt/archive/refs/tags/0.12.44.tar.gz -> ${P}.tar.gz
		$(cargo_crate_uris)
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

RESTRICT="test"
distutils_enable_tests pytest

src_compile() {
	cargo_src_compile
	distutils-r1_src_compile

}


src_install() {
    distutils-r1_src_install
}

distutils-r1_python_install() {
    distutils_pep517_install "${ED}"

}

