EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Client library to connect to the LangSmith Observability and Evaluation Platform"
HOMEPAGE="https://smith.langchain.com/ https://docs.smith.langchain.com/ https://github.com/langchain-ai/langsmith-sdk"
SRC_URI="https://github.com/langchain-ai/langsmith-sdk/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="otel vcr pytest langsmith_pyo3 openai-agents claude-agent-sdk test"

# pyproject.toml è qui:
S="${WORKDIR}/langsmith-sdk-${PV}/python"

RDEPEND="
	>=dev-python/pydantic-2[${PYTHON_USEDEP}]
	<dev-python/pydantic-3[${PYTHON_USEDEP}]
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.23.0[${PYTHON_USEDEP}]
	<dev-python/httpx-1[${PYTHON_USEDEP}]
	>=dev-python/requests-toolbelt-1.0.0[${PYTHON_USEDEP}]
	>=dev-python/zstandard-0.23.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/uuid-utils-0.12.0[${PYTHON_USEDEP}]
	<dev-python/uuid-utils-1.0[${PYTHON_USEDEP}]
	>=dev-python/xxhash-3.0.0[${PYTHON_USEDEP}]

	otel? (
		>=dev-python/opentelemetry-sdk-1.30.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-api-1.30.0[${PYTHON_USEDEP}]
		>=dev-python/opentelemetry-exporter-otlp-proto-http-1.30.0[${PYTHON_USEDEP}]
	)
	vcr? ( >=dev-python/vcrpy-7.0.0[${PYTHON_USEDEP}] )
	pytest? (
		>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
		>=dev-python/rich-13.9.4[${PYTHON_USEDEP}]
		>=dev-python/vcrpy-7.0.0[${PYTHON_USEDEP}]
	)
	langsmith_pyo3? ( >=dev-python/langsmith-pyo3-0.1.0_rc2[${PYTHON_USEDEP}] )
	openai-agents? ( >=dev-python/openai-agents-0.0.3[${PYTHON_USEDEP}] )
	claude-agent-sdk? ( >=dev-python/claude-agent-sdk-0.1.0[${PYTHON_USEDEP}] )
"
RDEPEND+=" $(python_gen_cond_dep '>=dev-python/orjson-3.9.14[${PYTHON_USEDEP}]' 'python*')"

BDEPEND="
	test? ( >=dev-python/pytest-7[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest
