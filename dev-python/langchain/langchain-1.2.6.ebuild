EAPI=8

PYTHON_COMPAT=( python3_{10..14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Building applications with LLMs through composability"
HOMEPAGE="https://python.langchain.com/ https://github.com/langchain-ai/langchain"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""


# Dipendenze required (minime) per langchain 1.2.6: langchain-core, langgraph, pydantic :contentReference[oaicite:1]{index=1}
RDEPEND="
	dev-python/langchain-core[${PYTHON_USEDEP}]
	dev-python/langgraph[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"

RESTRICT="test"
