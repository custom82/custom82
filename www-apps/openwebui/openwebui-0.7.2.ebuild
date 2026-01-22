EAPI=8

PYTHON_COMPAT=( python3_11 python3_12 )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Open WebUI"
HOMEPAGE="https://github.com/open-webui/open-webui"
SRC_URI="https://github.com/open-webui/open-webui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="open-webui"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="${PYTHON_DEPS}"
DEPEND="${RDEPEND}"
BDEPEND=">=dev-lang/nodejs-18.13.0"

S="${WORKDIR}/${PN}-${PV}"

pkg_postinst() {
	elog "Open WebUI installs the open-webui CLI entrypoint."
	elog "Run: open-webui serve"
}
