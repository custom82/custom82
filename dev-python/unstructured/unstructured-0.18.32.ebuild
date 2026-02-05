# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="A library that prepares raw documents for downstream ML tasks"
HOMEPAGE="
	https://github.com/Unstructured-IO/unstructured
	https://pypi.org/project/unstructured/
"
SRC_URI="https://github.com/Unstructured-IO/unstructured/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"

S="${WORKDIR}/unstructured-${PV}"

# Dipendenze base (senza extras tipo pdf/docx/pptx/...):
# elenco coerente con i "Required dependencies" della serie 0.18.x.
RDEPEND="
	dev-python/backoff[${PYTHON_USEDEP}]
	dev-python/beautifulsoup4[${PYTHON_USEDEP}]
	dev-python/charset-normalizer[${PYTHON_USEDEP}]
	dev-python/dataclasses-json[${PYTHON_USEDEP}]
	dev-python/emoji[${PYTHON_USEDEP}]
	dev-python/filetype[${PYTHON_USEDEP}]
	dev-python/html5lib[${PYTHON_USEDEP}]
	dev-python/langdetect[${PYTHON_USEDEP}]
	dev-python/lxml[${PYTHON_USEDEP}]
	dev-python/nltk[${PYTHON_USEDEP}]
	dev-python/numba[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/python-iso639[${PYTHON_USEDEP}]
	dev-python/python-magic[${PYTHON_USEDEP}]
	dev-python/python-oxmsg[${PYTHON_USEDEP}]
	dev-python/rapidfuzz[${PYTHON_USEDEP}]
	dev-python/requests[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
	dev-python/unstructured-python-client[${PYTHON_USEDEP}]
	dev-python/wrapt[${PYTHON_USEDEP}]
"

DEPEND="${RDEPEND}"

# Se il progetto include pacchetti dati o file non-python “strani”, aggiungi qui eventuali fix.
python_prepare_all() {
	distutils-r1_python_prepare_all
}
