EAPI=8

PYTHON_COMPAT=( python{3_11,3_12,3_13,3_14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Python SDK for Milvus"
HOMEPAGE="https://pypi.org/project/pymilvus/"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="bulk-writer model milvus-lite"

RDEPEND="
	>=dev-python/cachetools-0[${PYTHON_USEDEP}]
	>=dev-python/grpcio-0[${PYTHON_USEDEP}]
	>=dev-python/numpy-0[${PYTHON_USEDEP}]
	>=dev-python/orjson-0[${PYTHON_USEDEP}]
	>=dev-python/pandas-0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-0[${PYTHON_USEDEP}]
	>=dev-python/python-dotenv-0[${PYTHON_USEDEP}]
	>=dev-python/memray-0[${PYTHON_USEDEP}]
	model? (
		>=dev-python/pymilvus-model-0[${PYTHON_USEDEP}]
	)
	milvus-lite? (
		>=dev-python/milvus-lite-0[${PYTHON_USEDEP}]
	)
	bulk-writer? (
	dev-python/pyarrow[${PYTHON_USEDEP}]
	dev-python/ujson[${PYTHON_USEDEP}]
)
"

# TODO: bulk-writer extra -> aggiungere dipendenze reali quando verificate
DEPEND="${RDEPEND}"

RESTRICT="test"
