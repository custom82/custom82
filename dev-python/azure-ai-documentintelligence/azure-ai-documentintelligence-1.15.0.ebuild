EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Microsoft Azure AI Document Intelligence Client Library for Python (built from Azure SDK monorepo snapshot)"
HOMEPAGE="https://github.com/Azure/azure-sdk-for-python/tree/main/sdk/documentintelligence/azure-ai-documentintelligence"

SRC_URI="https://github.com/Azure/azure-sdk-for-python/archive/refs/tags/azure-ai-evaluation_${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

S="${WORKDIR}/azure-sdk-for-python-azure-ai-evaluation_1.15.0/sdk/documentintelligence/azure-ai-documentintelligence"

RDEPEND="
	>=dev-python/azure-core-1.30.0[${PYTHON_USEDEP}]
	dev-python/isodate[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
		dev-python/pytest-asyncio[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
