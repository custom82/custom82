EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Microsoft Azure Core Library for Python"
HOMEPAGE="
	https://pypi.org/project/azure-core/
	https://github.com/Azure/azure-sdk-for-python
"
SRC_URI="https://files.pythonhosted.org/packages/source/a/azure-core/azure_core-${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/azure_core-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/requests-2.18.4[${PYTHON_USEDEP}]
	>=dev-python/six-1.11.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
"
BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
