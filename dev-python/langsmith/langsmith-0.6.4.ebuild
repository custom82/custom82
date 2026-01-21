EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Client library to connect to the LangSmith Observability and Evaluation Platform"
HOMEPAGE="https://docs.langchain.com/langsmith/home https://github.com/langchain-ai/langsmith-sdk"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

RDEPEND="
	>=dev-python/httpx-0.25[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.5[${PYTHON_USEDEP}]
	>=dev-python/requests-2.31[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1.0[${PYTHON_USEDEP}]
	>=dev-python/uuid-utils-0.9[${PYTHON_USEDEP}]
	>=dev-python/zstandard-0.22[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/hatchling-1.20[${PYTHON_USEDEP}]
"

# Nel caso (raro) in cui per qualche ragione si finisca su setuptools,
# rimuoviamo i top-level extra che fanno fallire l'auto-discovery.
python_prepare_all() {
	# setuptools >=61 rifiuta i progetti "flat" con più top-level packages.
	# Nell'sdist di langsmith ci sono directory extra che non vanno installate.
	rm -rf bench cassettes || die

	distutils-r1_python_prepare_all
}

RESTRICT="test"
