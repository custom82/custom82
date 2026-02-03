EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Python interface to Oracle Database (python-oracledb)"
HOMEPAGE="
	https://pypi.org/project/oracledb/
	https://python-oracledb.readthedocs.io/
	https://github.com/oracle/python-oracledb
"

# PyPI: "UPL-1.0 OR Apache-2.0"
LICENSE="|| ( UPL-1.0 Apache-2.0 )"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="
	azure-auth
	azure-config
	oci-auth
	oci-config
	test
"

# A runtime dependency: cryptography (thin mode); docs recommend keeping it updated.
# Optional extras: oci/azure providers + MSAL.
RDEPEND="
	>=dev-python/cryptography-0[${PYTHON_USEDEP}]

	oci-config? ( dev-python/oci[${PYTHON_USEDEP}] )
	oci-auth? ( dev-python/oci[${PYTHON_USEDEP}] )

	azure-config? (
		dev-python/azure-appconfiguration[${PYTHON_USEDEP}]
		dev-python/azure-identity[${PYTHON_USEDEP}]
		dev-python/azure-keyvault-secrets[${PYTHON_USEDEP}]
	)
	azure-auth? ( dev-python/msal[${PYTHON_USEDEP}] )
"

# Se finisci a compilare da sdist, spesso serve Cython.
# (Se invece Gentoo usa un sdist "pre-cythonizzato", questa dip potrebbe essere superflua,
# ma è una scelta pragmatica per evitare build che falliscono.)
BDEPEND="
	dev-python/cython[${PYTHON_USEDEP}]
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

distutils_enable_tests pytest

python_test() {
	# I test upstream richiedono DB Oracle/config e spesso non sono eseguibili in sandbox.
	# Se vuoi provarli localmente, rimuovi questo blocco e configura l'ambiente come in upstream.
	epytest -q || die
}
