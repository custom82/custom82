# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="LangChain text splitting utilities"
HOMEPAGE="https://python.langchain.com/ https://github.com/langchain-ai/langchain"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

# upstream: requires Python >=3.10 :contentReference[oaicite:1]{index=1}
python_check_deps() {
	python_has_version -b "dev-python/langchain-core[${PYTHON_USEDEP}]"
}

RDEPEND="
	dev-python/langchain-core[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/setuptools[${PYTHON_USEDEP}]
"

# Test upstream spesso tirano dentro dipendenze pesanti (es. tokenizers/transformers, ecc.)
RESTRICT="test"
