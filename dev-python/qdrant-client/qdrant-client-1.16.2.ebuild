# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

DISTUTILS_USE_PEP517=poetry

inherit distutils-r1 pypi

DESCRIPTION="Client library and SDK for the Qdrant vector search engine"
HOMEPAGE="
	https://pypi.org/project/qdrant-client/
	https://github.com/qdrant/qdrant-client
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="fastembed"
RESTRICT="test"

RDEPEND="
	>=dev-python/grpcio-1.41.0[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.20.0[${PYTHON_USEDEP}]
	>=dev-python/numpy-1.21.0[${PYTHON_USEDEP}]
	>=dev-python/portalocker-2.7.0[${PYTHON_USEDEP}]
	>=dev-python/protobuf-3.20.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-1.10.8[${PYTHON_USEDEP}]
	>=dev-python/urllib3-1.26.14[${PYTHON_USEDEP}]
	fastembed? ( >=dev-python/fastembed-0[${PYTHON_USEDEP}] )
"

# backend PEP517 (poetry-core) + toolchain PEP517 già tirata dentro da distutils-r1
BDEPEND="
	>=dev-python/poetry-core-1.0.0[${PYTHON_USEDEP}]
	test? ( dev-python/pytest[${PYTHON_USEDEP}] )
"

distutils_enable_tests pytest
