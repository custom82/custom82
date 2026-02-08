EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Multilingual sentence embeddings using Transformers"
HOMEPAGE="https://www.sbert.net https://github.com/huggingface/sentence-transformers"
SRC_URI="https://github.com/huggingface/sentence-transformers/archive/refs/tags/v${PV}.tar.gz
    -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
    >=dev-python/transformers-4.41.0[${PYTHON_USEDEP}]
    >=dev-python/torch-2.2.0[${PYTHON_USEDEP}]
    >=dev-python/scikit-learn-1.4.0[${PYTHON_USEDEP}]
    >=dev-python/scipy-1.11.0[${PYTHON_USEDEP}]
    >=dev-python/numpy-1.26[${PYTHON_USEDEP}]
    >=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
    >=dev-python/huggingface-hub-0.23.0[${PYTHON_USEDEP}]
    >=dev-python/PyYAML-6.0[${PYTHON_USEDEP}]
    >=dev-python/Pillow-10.0.0[${PYTHON_USEDEP}]
"

BDEPEND="
    test? (
        dev-python/pytest[${PYTHON_USEDEP}]
    )
"

distutils_enable_tests pytest
