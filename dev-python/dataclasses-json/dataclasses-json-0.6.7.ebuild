EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=poetry
inherit distutils-r1

DESCRIPTION="Easily serialize dataclasses to and from JSON"
HOMEPAGE="
	https://github.com/lidatong/dataclasses-json
	https://pypi.org/project/dataclasses-json/
"
SRC_URI="https://github.com/lidatong/dataclasses-json/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="test"

RESTRICT="!test? ( test )"

RDEPEND="
	>=dev-python/typing-inspect-0.4.0[${PYTHON_USEDEP}]
	>=dev-python/marshmallow-3.18.0[${PYTHON_USEDEP}]
"

BDEPEND="
	>=dev-python/poetry-core-1.2.0[${PYTHON_USEDEP}]
	dev-python/poetry-dynamic-versioning[${PYTHON_USEDEP}]
	test? (
		>=dev-python/pytest-7.1[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

S="${WORKDIR}/${PN}-${PV}"

src_prepare() {
	# distutils-r1 (older) expects backend "poetry.core.masonry.api" when using DISTUTILS_USE_PEP517=poetry
	# upstream uses poetry-dynamic-versioning backend, so rewrite it for Gentoo build.
	sed -i \
		-e 's|^build-backend = "poetry_dynamic_versioning\.backend"$|build-backend = "poetry.core.masonry.api"|' \
		pyproject.toml || die

	distutils-r1_src_prepare
}
