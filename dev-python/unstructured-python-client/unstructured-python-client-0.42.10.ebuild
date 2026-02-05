# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=poetry

inherit distutils-r1

MY_PN="unstructured-python-client"

DESCRIPTION="Python Client SDK for Unstructured API"
HOMEPAGE="https://github.com/Unstructured-IO/unstructured-python-client"
SRC_URI="https://github.com/Unstructured-IO/${MY_PN}/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/${MY_PN}-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

RDEPEND="
	dev-python/aiofiles[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	dev-python/httpcore[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/pypdf[${PYTHON_USEDEP}]
	dev-python/pypdfium2[${PYTHON_USEDEP}]
	dev-python/requests-toolbelt[${PYTHON_USEDEP}]
"

src_prepare() {
	default

	# Fix upstream tarball: pyproject.toml references README-PYPI.md
	# but it's not shipped in the GitHub release tarball -> poetry-core fails.
	if [[ -f pyproject.toml ]] && ! [[ -f README-PYPI.md ]] ; then
		# Prefer README.md if present, otherwise create a minimal README-PYPI.md.
		if [[ -f README.md ]] ; then
			sed -i \
				-e 's:^\(\s*readme\s*=\s*\)"README-PYPI\.md"\s*$:\1"README.md":' \
				pyproject.toml || die
		else
			: > README-PYPI.md || die
		fi
	fi
}
