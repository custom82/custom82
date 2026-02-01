# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

inherit python-r1

DESCRIPTION="Reference for psycopg2-binary, but with name usable in import"
HOMEPAGE="https://pypi.org/project/psycopgbinary/"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"

IUSE="${PYTHON_TARGETS_USEDEP}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

SRC_URI="https://files.pythonhosted.org/packages/py2.py3/${PN:0:1}/${PN}/${PN}-${PV}-py2.py3-none-any.whl"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/psycopg2-binary[${PYTHON_USEDEP}]
"
BDEPEND="
	${PYTHON_DEPS}
	app-arch/unzip
	virtual/allow-pypi-wheels
"

S="${WORKDIR}"

src_unpack() {
	mkdir -p "${S}" || die
	cd "${S}" || die
	unzip -q "${DISTDIR}/${A}" || die "unzip failed"
}

python_install() {
	local sitedir
	sitedir="$(python_get_sitedir)" || die

	insinto "${sitedir}"

	# nel wheel c'è un modulo singolo, non un package/
	[[ -f psycopgbinary.py ]] || die "Missing psycopgbinary.py in wheel"
	doins psycopgbinary.py || die

	# dist-info ha il punto: ${PN}-${PV}.dist-info
	local di="${PN}-${PV}.dist-info"
	[[ -d ${di} ]] || die "Missing ${di} in wheel"
	doins -r "${di}" || die
}

src_install() {
	python_foreach_impl python_install
	python_foreach_impl python_optimize
}
