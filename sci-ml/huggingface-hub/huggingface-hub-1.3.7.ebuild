EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Client library to download and publish models, datasets and other repos on the Hugging Face Hub"
HOMEPAGE="
	https://github.com/huggingface/huggingface_hub
	https://pypi.org/project/huggingface-hub/
"
LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# Extra upstream: oauth, torch, fastai, hf-xet, mcp, typing, quality
IUSE="fastai hf-xet mcp oauth quality torch typing"

# I test upstream spesso richiedono rete/token o fanno integrazioni: lasciamo spenti.
RESTRICT="test"

RDEPEND="
	dev-python/filelock[${PYTHON_USEDEP}]
	>=dev-python/fsspec-2023.5.0[${PYTHON_USEDEP}]
	<dev-python/httpx-1.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-20.9[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-5.1[${PYTHON_USEDEP}]
	dev-python/shellingham[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.42.1[${PYTHON_USEDEP}]
	dev-python/typer-slim[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.1.0[${PYTHON_USEDEP}]

	hf-xet? (
		dev-python/hf-xet[${PYTHON_USEDEP}]
	)

	oauth? (
		dev-python/authlib[${PYTHON_USEDEP}]
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/itsdangerous[${PYTHON_USEDEP}]
	)

	torch? (
		dev-python/torch[${PYTHON_USEDEP}]
		dev-python/safetensors[${PYTHON_USEDEP}]
	)

	fastai? (
		dev-python/fastai[${PYTHON_USEDEP}]
		dev-python/fastcore[${PYTHON_USEDEP}]
		dev-python/toml[${PYTHON_USEDEP}]
	)

	mcp? (
		dev-python/mcp[${PYTHON_USEDEP}]
	)

	typing? (
		>=dev-python/typing-extensions-4.8.0[${PYTHON_USEDEP}]
		dev-python/types-pyyaml[${PYTHON_USEDEP}]
		dev-python/types-simplejson[${PYTHON_USEDEP}]
		dev-python/types-toml[${PYTHON_USEDEP}]
		dev-python/types-tqdm[${PYTHON_USEDEP}]
		dev-python/types-urllib3[${PYTHON_USEDEP}]
	)

	quality? (
		dev-python/ruff[${PYTHON_USEDEP}]
		~dev-python/mypy-1.15.0[${PYTHON_USEDEP}]
		>=dev-python/libcst-1.4.0[${PYTHON_USEDEP}]
		dev-python/ty[${PYTHON_USEDEP}]
	)
"
