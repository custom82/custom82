# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="Flexible and powerful tensor operations for readable and reliable code"
HOMEPAGE="https://github.com/arogozhnikov/einops https://pypi.org/project/einops/"
SRC_URI="https://github.com/arogozhnikov/einops/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"

# Il tarball da GitHub estrae in einops-<ver>
S="${WORKDIR}/einops-${PV}"

distutils_enable_tests pytest

# Test minimi: molte parti del progetto testano anche backend opzionali (torch/jax/tf),
# ma con pytest + numpy si riesce in genere a coprire il core.
BDEPEND="
	test? (
		dev-python/numpy[${PYTHON_USEDEP}]
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"
