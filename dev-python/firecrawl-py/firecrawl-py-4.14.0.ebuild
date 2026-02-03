EAPI=8

PYTHON_COMPAT=( python3_{11..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Python SDK for Firecrawl API"
HOMEPAGE="
	https://pypi.org/project/firecrawl-py/
	https://docs.firecrawl.dev/sdks/python
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"

S="${WORKDIR}/${P/-/_}"

RDEPEND="
	dev-python/aiohttp[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/nest-asyncio[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/python-dotenv[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/websockets[${PYTHON_USEDEP}]
"

python_install() {
	distutils-r1_python_install

	# QA: stray top-level tests in site-packages
	rm -rf "${D}$(python_get_sitedir)/tests" || die
}
