# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Efficient and Effective Passage Search via Contextualized Late Interaction over BERT (ColBERT v2)"
HOMEPAGE="
	https://pypi.org/project/colbert-ai/
	https://github.com/stanford-futuredata/ColBERT
"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="torch faiss-cpu faiss-gpu"
REQUIRED_USE="
	faiss-gpu? ( !faiss-cpu )
"

# Test suite tipicamente non adatta al packaging (richiede dataset/GPU ecc.)
RESTRICT="test"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/transformers[${PYTHON_USEDEP}]

	torch? ( dev-python/torch[${PYTHON_USEDEP}] )
	faiss-cpu? ( sci-libs/faiss[python] )
	faiss-gpu? ( sci-libs/faiss[python] )
"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

# Se upstream non include file di test “standard”, lasciamo i default di distutils-r1.
