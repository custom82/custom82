# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Client library to connect to the LangSmith Observability and Evaluation Platform"
HOMEPAGE="https://docs.langchain.com/langsmith/home https://github.com/langchain-ai/langsmith-sdk"
SRC_URI="$(pypi_sdist_url)"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

# Required dependencies as reported by package metadata aggregators for PyPI langsmith :contentReference[oaicite:1]{index=1}
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
	>=dev-python/setuptools-68[${PYTHON_USEDEP}]
"

# upstream tests tirano dentro extras (vcr/pytest/otel ecc.)
RESTRICT="test"
