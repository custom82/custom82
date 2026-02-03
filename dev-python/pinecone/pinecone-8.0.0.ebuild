# Copyright 2026 Gentoo Authors
EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 pypi

DESCRIPTION="Pinecone Python SDK (vector database client)"
HOMEPAGE="https://www.pinecone.io/"
SRC_URI="https://files.pythonhosted.org/packages/source/p/pinecone/pinecone-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE=""

RDEPEND="
    dev-python/certifi
    dev-python/orjson
    dev-python/pandas
    dev-python/pinecone-plugin-assistant
"
DEPEND="${RDEPEND}
    dev-python/hatchling
"

PYPI_FORCE_BUILD=1

python_prepare() {
    # nessuna patch specifica
    :
}

python_install() {
    # installa la libreria python
    distutils-r1_python_install
}
