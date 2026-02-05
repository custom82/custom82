EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=hatchling
DISTUTILS_SINGLE_IMPL=1

inherit distutils-r1 python-single-r1 systemd

DESCRIPTION="Open WebUI - User-friendly interface for LLMs"
HOMEPAGE="https://github.com/open-webui/open-webui"
SRC_URI="https://github.com/open-webui/open-webui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/open-webui-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="
	${PYTHON_SINGLE_TARGET_IUSE}
	+frontend
	postgres
	+redis
	+chroma
	+opensearch
	+whisper
	+ocr
	+transformers
	+rag
	test
"

REQUIRED_USE="${PYTHON_REQUIRED_USE}"
RESTRICT="!test? ( test )"

RDEPEND="
	${PYTHON_DEPS}

	$(python_gen_cond_dep '
		>=dev-python/fastapi-0.128.0[${PYTHON_USEDEP}]
		>=dev-python/uvicorn-0.40.0[${PYTHON_USEDEP}]
		>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
		>=dev-python/python-multipart-0.0.21[${PYTHON_USEDEP}]
		>=dev-python/itsdangerous-2.2.0[${PYTHON_USEDEP}]
		>=dev-python/python-socketio-5.16.0[${PYTHON_USEDEP}]
		>=dev-python/python-jose-3.5.0[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		>=dev-python/bcrypt-5.0.0[${PYTHON_USEDEP}]
		>=dev-python/argon2-cffi-25.1.0[${PYTHON_USEDEP}]
		>=dev-python/pyjwt-2.10.0[${PYTHON_USEDEP}]
		>=dev-python/authlib-1.6.6[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
		>=dev-python/aiohttp-3.13.2[${PYTHON_USEDEP}]
		dev-python/async-timeout[${PYTHON_USEDEP}]
		dev-python/aiocache[${PYTHON_USEDEP}]
		dev-python/aiofiles[${PYTHON_USEDEP}]
		>=dev-python/httpx-0.28.1[cli,${PYTHON_USEDEP}]
		>=dev-python/sqlalchemy-2.0.45[${PYTHON_USEDEP}]
		>=dev-python/alembic-1.18.1[${PYTHON_USEDEP}]
		>=dev-python/peewee-3.19.0[${PYTHON_USEDEP}]
		>=dev-python/peewee-migrate-1.14.3[${PYTHON_USEDEP}]
		>=dev-python/apscheduler-3.11.2[${PYTHON_USEDEP}]
		>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
		dev-python/tiktoken[${PYTHON_USEDEP}]
	')

	redis? ( dev-db/redis )

	chroma? (
		$(python_gen_cond_dep '
			>=dev-python/chromadb-1.4.1[${PYTHON_USEDEP}]
		')
	)

	opensearch? (
		$(python_gen_cond_dep '
			>=dev-python/opensearch-py-3.1.0[${PYTHON_USEDEP}]
		')
	)

	transformers? (
		$(python_gen_cond_dep '
			>=sci-ml/transformers-4.57.6[${PYTHON_USEDEP}]
			>=dev-python/sentence-transformers-5.2.0[${PYTHON_USEDEP}]
			sci-ml/accelerate[${PYTHON_USEDEP}]
		')
	)

	rag? (
		$(python_gen_cond_dep '
			>=dev-python/pypdf-6.6.0[${PYTHON_USEDEP}]
			>=dev-python/pandas-2.3.3[${PYTHON_USEDEP}]
			dev-python/psutil[${PYTHON_USEDEP}]
		')
	)

	ocr? (
		$(python_gen_cond_dep '
			>=media-libs/opencv-4.12.0[python,${PYTHON_USEDEP}]
			>=dev-python/rapidocr-onnxruntime-1.4.4[${PYTHON_USEDEP}]
		')
	)

	whisper? (
		>=dev-python/faster_whisper-1.2.1[${PYTHON_SINGLE_USEDEP}]
	)

	postgres? (
		$(python_gen_cond_dep '
			dev-python/psycopg:2[${PYTHON_USEDEP}]
			dev-python/pgvector[${PYTHON_USEDEP}]
		')
	)
"

DEPEND="${RDEPEND}"

BDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep 'dev-python/hatchling[${PYTHON_USEDEP}]')
	frontend? ( >=net-libs/nodejs-18 )
"

distutils_enable_tests pytest

pkg_postinst() {
	systemd_dounit "${FILESDIR}/openwebui.service"
}
