EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1

DESCRIPTION="Multilingual sentence embeddings using Transformers"
HOMEPAGE="https://www.sbert.net https://github.com/huggingface/sentence-transformers"
SRC_URI="https://github.com/huggingface/sentence-transformers/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=sci-ml/transformers-4.41.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/pytorch-2.2.0[${PYTHON_SINGLE_USEDEP}]
	>=sci-ml/huggingface_hub-0.23.0[${PYTHON_SINGLE_USEDEP}]

	$(python_gen_cond_dep '
		>=dev-python/scikit-learn-1.4.0[${PYTHON_USEDEP}]
		>=dev-python/scipy-1.11.0[${PYTHON_USEDEP}]
		>=dev-python/numpy-1.26[${PYTHON_USEDEP}]
		>=dev-python/tqdm-4.66.0[${PYTHON_USEDEP}]
		>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
		>=dev-python/pillow-10.0.0[${PYTHON_USEDEP}]
	')
"

BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/pytest[${PYTHON_USEDEP}]
		')
	)
"

distutils_enable_tests pytest
