EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Microsoft Azure Blob Storage client library for Python"
HOMEPAGE="
	https://github.com/Azure/azure-sdk-for-python
	https://learn.microsoft.com/en-us/python/api/overview/azure/storage-blob-readme
"

SRC_URI="https://github.com/Azure/azure-sdk-for-python/archive/refs/tags/azure-storage-blob_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/azure-sdk-for-python-azure-storage-blob_${PV}/sdk/storage/azure-storage-blob"

IUSE="aio test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/azure-core-1.37.0[${PYTHON_USEDEP}]
	>=dev-python/cryptography-2.1.4[${PYTHON_USEDEP}]
	>=dev-python/isodate-0.6.1[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]
	aio? ( >=dev-python/azure-core-1.37.0[aio,${PYTHON_USEDEP}] )
"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
