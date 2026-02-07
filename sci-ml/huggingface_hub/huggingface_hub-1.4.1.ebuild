EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Client library to download and publish models and datasets on the Hugging Face Hub"
HOMEPAGE="https://github.com/huggingface/huggingface_hub"


SRC_URI="https://github.com/huggingface/huggingface_hub/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"
S="${WORKDIR}/huggingface_hub-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

IUSE="cli hf-xet oauth test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/filelock-3.0[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2023.5.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	<dev-python/httpx-1[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.9[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]

	cli? (
		dev-python/typer[${PYTHON_USEDEP}]
		dev-python/rich[${PYTHON_USEDEP}]
		dev-python/shellingham[${PYTHON_USEDEP}]
	)

	hf-xet? ( dev-python/hf-xet[${PYTHON_USEDEP}] )

	oauth? (
		>=dev-python/authlib-1.3.2[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/itsdangerous[${PYTHON_USEDEP}]
	)
"

BDEPEND="
	test? (
		>=dev-python/pytest-8[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/pytest-mock[${PYTHON_USEDEP}]
		dev-python/pytest-xdist[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	# Evita test che fanno rete/integration
	epytest -m "not integration"
}

