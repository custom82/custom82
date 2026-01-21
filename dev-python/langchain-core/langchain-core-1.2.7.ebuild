# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Base abstractions for the LangChain ecosystem"
HOMEPAGE="https://github.com/langchain-ai/langchain https://reference.langchain.com/python/langchain_core/"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

# PyPI: requires Python >=3.10 :contentReference[oaicite:1]{index=1}
# Required deps list (core): jsonpatch, langsmith, packaging, pydantic, pyyaml,
# tenacity, typing-extensions, uuid-utils :contentReference[oaicite:2]{index=2}
RDEPEND="
	>=dev-python/jsonpatch-1.33[${PYTHON_USEDEP}]
	>=dev-python/langsmith-0.1.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.5[${PYTHON_USEDEP}]
	>=dev-python/pyyaml-6.0[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.2[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.9[${PYTHON_USEDEP}]
	>=dev-python/uuid-utils-0.9[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/setuptools-68[${PYTHON_USEDEP}]
"

# Test upstream spesso trascinano extras e snapshot di dataset: meglio abilitarli solo se li vuoi.
RESTRICT="test"
