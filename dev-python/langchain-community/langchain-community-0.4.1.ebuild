EAPI=8

PYTHON_COMPAT=( python3_{10,11,12,13,14} )

DISTUTILS_USE_PEP517=pdm-backend

inherit distutils-r1

MY_PN="langchain-community"
MY_TAG="libs/community/v${PV}"
MY_P="${MY_PN}-libs-community-v${PV}"

DESCRIPTION="Community contributed LangChain integrations"
HOMEPAGE="
	https://github.com/langchain-ai/langchain-community
	https://pypi.org/project/langchain-community/
"
SRC_URI="https://github.com/langchain-ai/${MY_PN}/archive/refs/tags/${MY_TAG}.tar.gz -> ${MY_P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

S="${WORKDIR}/${MY_P}/libs/community"

RDEPEND="
	$(python_gen_cond_dep '
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/dataclasses-json[${PYTHON_USEDEP}]
		dev-python/httpx-sse[${PYTHON_USEDEP}]
		dev-python/langchain-core[${PYTHON_USEDEP}]
		dev-python/langsmith[${PYTHON_USEDEP}]
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pydantic-settings[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/tenacity[${PYTHON_USEDEP}]
	')
"

BDEPEND="
	$(python_gen_cond_dep '
		dev-python/pdm-backend[${PYTHON_USEDEP}]
		test? (
			dev-python/pytest[${PYTHON_USEDEP}]
		)
	')
"

distutils_enable_tests pytest
