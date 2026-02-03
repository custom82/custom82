# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Run your raw PyTorch training script on any kind of device"
HOMEPAGE="https://github.com/huggingface/accelerate"
SRC_URI="https://github.com/huggingface/${PN}/archive/refs/tags/v${PV}.tar.gz
	-> ${P}.gh.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

# di solito i test richiedono torch + setup specifici (distributed/GPU ecc.)
RESTRICT="test"

RDEPEND="
	sci-ml/huggingface_hub[${PYTHON_USEDEP}]
	sci-ml/pytorch[${PYTHON_USEDEP}]
	$(python_gen_cond_dep '
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		sci-ml/safetensors[${PYTHON_USEDEP}]
	')
"

BDEPEND="
	test? (
		$(python_gen_cond_dep '
			dev-python/networkx[${PYTHON_USEDEP}]
			dev-python/parameterized[${PYTHON_USEDEP}]
		')
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
