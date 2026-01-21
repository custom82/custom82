# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi cargo

DESCRIPTION="CRDTs based on Yrs."
HOMEPAGE="https://github.com/y-crdt/pycrdt"

CRATES="\
serde_json-1.0.140\
yrs-0.25.0\
pyo3-0.27.1\
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

