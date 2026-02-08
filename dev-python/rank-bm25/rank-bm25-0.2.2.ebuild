EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Various BM25 algorithms for document ranking"
HOMEPAGE="https://github.com/dorianbrown/rank_bm25"
SRC_URI="https://github.com/dorianbrown/rank_bm25/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

RDEPEND="
	dev-python/numpy[${PYTHON_USEDEP}]
"

S="${WORKDIR}/rank_bm25-${PV}"

src_prepare() {
	default

	# override get_version() (accetta anche chiamata senza argomenti)
	sed -i '/^def get_version/,/^$/c\
def get_version(package_name=None):\
    return "'"${PV}"'"\
' version.py || die
}
