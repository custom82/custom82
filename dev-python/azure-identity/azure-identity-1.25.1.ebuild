EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

MY_REPO="azure-sdk-for-python"
MY_TAG="azure-identity_${PV}"

DESCRIPTION="Microsoft Azure Identity Library for Python"
HOMEPAGE="
	https://pypi.org/project/azure-identity/
	https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/identity/azure-identity
"
SRC_URI="https://github.com/Azure/${MY_REPO}/archive/refs/tags/${MY_TAG}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${MY_REPO}-${MY_TAG}/sdk/identity/azure-identity"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/azure-core-1.31.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.5[${PYTHON_USEDEP}]
	>=dev-python/msal-1.31.0[${PYTHON_USEDEP}]
	>=dev-python/msal-extensions-1.2.0[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.0.0[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/setuptools-77.0.3[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
