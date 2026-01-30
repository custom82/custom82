# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..13} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Google GenAI SDK for Python (Gemini, text, multimodal APIs)"
HOMEPAGE="https://pypi.org/project/google-genai/ https://github.com/googleapis/python-genai"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/requests-2.31[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.7[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.8[${PYTHON_USEDEP}]
	>=dev-python/tqdm-4.66[${PYTHON_USEDEP}]
	>=dev-python/python-dateutil-2.9[${PYTHON_USEDEP}]
	>=dev-python/protobuf-4.25[${PYTHON_USEDEP}]
	>=dev-python/google-auth-2.29[${PYTHON_USEDEP}]
"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
