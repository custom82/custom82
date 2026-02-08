EAPI=8

DISTUTILS_USE_PEP517=poetry
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Decrypting/encrypting MS Office files using passwords or other keys"
HOMEPAGE="https://github.com/nolze/msoffcrypto-tool"
SRC_URI="https://github.com/nolze/msoffcrypto-tool/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

RESTRICT="test"

RDEPEND="
	>=dev-python/cryptography-35.0[${PYTHON_USEDEP}]
	>=dev-python/olefile-0.46[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"

S="${WORKDIR}/${PN}-${PV}"

python_install() {
	distutils-r1_python_install

	# poetry/gpep517 mette NOTICE.txt top-level in site-packages -> QA stray files
	local sp="${ED}$(python_get_sitedir)"
	if [[ -f "${sp}/NOTICE.txt" ]] ; then
		dodoc "${sp}/NOTICE.txt" || die
		rm -f "${sp}/NOTICE.txt" || die
	fi
}
