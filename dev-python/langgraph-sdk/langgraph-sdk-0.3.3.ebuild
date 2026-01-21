# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="SDK for interacting with LangGraph API"
HOMEPAGE="https://pypi.org/project/langgraph-sdk/"
# pypi.eclass compone già SRC_URI

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
IUSE="test"

# LangGraph SDK richiede Python >= 3.10 su PyPI
# (metadato in pagina progetto) :contentReference[oaicite:1]{index=1}
RESTRICT="!test? ( test )"


BDEPEND="
	>=dev-python/hatchling-1.18.0[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
	)
"

RDEPEND="
	>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
	>=dev-python/anyio-4.0.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.7.0[${PYTHON_USEDEP}]
	>=dev-python/orjson-3.9.0[${PYTHON_USEDEP}]
	>=dev-python/packaging-23.2[${PYTHON_USEDEP}]
	>=dev-python/tenacity-8.1.0[${PYTHON_USEDEP}]
"

distutils_enable_tests pytest
