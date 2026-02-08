EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{11,12,13,14} )

inherit distutils-r1

DESCRIPTION="Python API to retrieve YouTube transcripts/subtitles (incl. auto-generated) without API keys"
HOMEPAGE="https://github.com/jdepoix/youtube-transcript-api"
SRC_URI="https://github.com/jdepoix/youtube-transcript-api/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

IUSE="test"
RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/requests-2.0.0[${PYTHON_USEDEP}]
	>=dev-python/defusedxml-0.7.0[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/poetry-core-1.0.0[${PYTHON_USEDEP}]
	test? (
		$(python_gen_cond_dep '
			>=dev-python/pytest-7.0.0[${PYTHON_USEDEP}]
		')
	)
"

S="${WORKDIR}/${PN}-${PV}"

distutils_enable_tests pytest
