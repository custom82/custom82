# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1 pypi

DESCRIPTION="Fast Base64 implementation"
HOMEPAGE="https://pypi.org/project/pybase64/"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

RDEPEND="
    sci-ml/transformers
    sci-ml/pytorch
    sci-ml/tokenizers
    sci-ml/huggingface_hub
    dev-python/datasets
    dev-python/accelerate
    dev-python/torchvision
    dev-python/tqdm
    dev-python/numpy
    dev-python/scipy
    dev-python/typing-extensions
"


BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

