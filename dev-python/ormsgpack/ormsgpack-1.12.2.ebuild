# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..14} )

CRATES="
ahash-0.8.12
bytecount-0.6.9
chrono-0.4.43
half-2.6.0
itoa-1.0.17
pyo3-0.27.2
serde-1.0.228
serde_bytes-0.11.19
simdutf8-0.1.5
smallvec-1.15.1
version_check-0.9.5
autocfg-1.5.0
bytecount-0.6.9
cfg-if-1.0.4
chrono-0.4.43
crunchy-0.2.4
half-2.7.1
itoa-1.0.17
libc-0.2.180
memoffset-0.9.1
num-traits-0.2.19
once_cell-1.21.3
portable-atomic-1.13.0
proc-macro2-1.0.105
pyo3-0.27.2
pyo3-build-config-0.27.2
pyo3-ffi-0.27.2
quote-1.0.43
serde-1.0.228
serde_bytes-0.11.19
serde_core-1.0.228
serde_derive-1.0.228
simdutf8-0.1.5
smallvec-1.15.1
syn-2.0.114
target-lexicon-0.13.4
unicode-ident-1.0.22
version_check-0.9.5
zerocopy-0.8.33
zerocopy-derive-0.8.33
"

inherit distutils-r1 cargo

DESCRIPTION="Fast MessagePack serialization/deserialization for Python using Rust"
HOMEPAGE="
	https://github.com/aviramha/ormsgpack
	https://pypi.org/project/ormsgpack/
"
SRC_URI="
	https://github.com/aviramha/ormsgpack/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	$(cargo_crate_uris)
"

LICENSE="Apache-2.0 MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND=""
DEPEND="
	${RDEPEND}
	dev-lang/rust
"
BDEPEND="
	dev-python/maturin[${PYTHON_USEDEP}]
"

S="${WORKDIR}/${P}"

# evita qualunque tentativo di scaricare wheel precompilate
export MATURIN_NO_PYTHON=1

# test upstream presenti ma spesso fragili in sandbox
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
