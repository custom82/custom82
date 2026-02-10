EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Dux Distributed Global Search. Metasearch library aggregating results from diverse web search services."
HOMEPAGE="https://github.com/deedy5/ddgs"
SRC_URI="https://github.com/deedy5/ddgs/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test http2 socks brotli"
RESTRICT="!test? ( test )"

# Repo tag layout: ddgs-9.10.0/
S="${WORKDIR}/ddgs-${PV}"

RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	>=dev-python/primp-0.15.0[${PYTHON_USEDEP}]
	>=dev-python/lxml-4.9.4[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[${PYTHON_USEDEP}]
	>=dev-python/fake-useragent-2.2.0[${PYTHON_USEDEP}]
	http2? ( dev-python/h2[${PYTHON_USEDEP}] )
	socks? ( dev-python/socksio[${PYTHON_USEDEP}] )
	brotli? ( dev-python/brotlicffi[${PYTHON_USEDEP}] )
"

BDEPEND="
	test? (
		>=dev-python/pytest-8.4.1[${PYTHON_USEDEP}]
		>=dev-python/pytest-dependency-0.6.0[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest
