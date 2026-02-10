EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Building applications with LLMs through composability"
HOMEPAGE="https://github.com/langchain-ai/langchain"

SRC_URI="https://github.com/langchain-ai/langchain/archive/refs/tags/langchain==${PV}.tar.gz
	-> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="
	community
	anthropic
	openai
	azure-ai
	google-vertexai
	google-genai
	fireworks
	ollama
	together
	mistralai
	huggingface
	groq
	aws
	deepseek
	xai
	perplexity
"

# Monorepo: il package python è qui
S="${WORKDIR}/langchain-langchain-${PV}/libs/langchain_v1"

RDEPEND="
	>=dev-python/langchain-core-${PV}[${PYTHON_USEDEP}]
	>=dev-python/langgraph-1.0.7[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.4[${PYTHON_USEDEP}]

	community? ( dev-python/langchain-community[${PYTHON_USEDEP}] )
	anthropic? ( dev-python/langchain-anthropic[${PYTHON_USEDEP}] )
	openai? ( dev-python/langchain-openai[${PYTHON_USEDEP}] )
	azure-ai? ( dev-python/langchain-azure-ai[${PYTHON_USEDEP}] )
	google-vertexai? ( dev-python/langchain-google-vertexai[${PYTHON_USEDEP}] )
	google-genai? ( dev-python/langchain-google-genai[${PYTHON_USEDEP}] )
	fireworks? ( dev-python/langchain-fireworks[${PYTHON_USEDEP}] )
	ollama? ( dev-python/langchain-ollama[${PYTHON_USEDEP}] )
	together? ( dev-python/langchain-together[${PYTHON_USEDEP}] )
	mistralai? ( dev-python/langchain-mistralai[${PYTHON_USEDEP}] )
	huggingface? ( dev-python/langchain-huggingface[${PYTHON_USEDEP}] )
	groq? ( dev-python/langchain-groq[${PYTHON_USEDEP}] )
	aws? ( dev-python/langchain-aws[${PYTHON_USEDEP}] )
	deepseek? ( dev-python/langchain-deepseek[${PYTHON_USEDEP}] )
	xai? ( dev-python/langchain-xai[${PYTHON_USEDEP}] )
	perplexity? ( dev-python/langchain-perplexity[${PYTHON_USEDEP}] )
"

BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"

RESTRICT="test"
