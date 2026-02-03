EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

inherit python-r1

DESCRIPTION="A high-level API to automate web browsers"
HOMEPAGE="https://pypi.org/project/playwright/ https://playwright.dev/python/"
SRC_URI="
	amd64? ( https://files.pythonhosted.org/packages/f1/af/009958cbf23fac551a940d34e3206e6c7eed2b8c940d0c3afd1feb0b0589/playwright-${PV}-py3-none-manylinux1_x86_64.whl )
	arm64? ( https://files.pythonhosted.org/packages/d9/a6/0e66ad04b6d3440dae73efb39540c5685c5fc95b17c8b29340b62abbd952/playwright-${PV}-py3-none-manylinux_2_17_aarch64.manylinux2014_aarch64.whl )
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# wheel binaria + test richiedono browser scaricati a runtime
RESTRICT="test"

S="${WORKDIR}"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/greenlet-3[${PYTHON_USEDEP}]
		>=dev-python/pyee-13[${PYTHON_USEDEP}]
	')
"

# python -m installer
BDEPEND="
	$(python_gen_cond_dep '
		dev-python/installer[${PYTHON_USEDEP}]
	')
"

# La wheel contiene binari precompilati nel driver Playwright
QA_PREBUILT="
	usr/lib*/python*/site-packages/playwright/driver/**
"

src_install() {
	python_foreach_impl python_install_wheel
	python_foreach_impl python_optimize
}


python_install_wheel() {
	# Installa la wheel usando l'interprete corrente (impl-specific)
	"${EPYTHON}" -m installer \
		--destdir="${D}" \
		--prefix=/usr \
		--no-compile-bytecode \
		"${DISTDIR}/${A}" || die
}
