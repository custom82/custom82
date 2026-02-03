EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="A python native Weaviate client"
HOMEPAGE="
	https://pypi.org/project/weaviate-client/
	https://github.com/weaviate/weaviate-python-client
"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="agents"
RESTRICT="test"

RDEPEND="
	dev-python/authlib[${PYTHON_USEDEP}]
	dev-python/deprecation[${PYTHON_USEDEP}]
	dev-python/grpcio[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/validators[${PYTHON_USEDEP}]
	agents? ( dev-python/weaviate-agents[${PYTHON_USEDEP}] )
"

# Assicura che valga anche nei subprocess (gpep517 install-wheel)
pkg_setup() {
	# Silenzia warning setuptools "Package ... is absent ..."
	# Manteniamo pattern largo e senza backtick.
	export PYTHONWARNINGS='ignore:Package .* is absent.*:UserWarning'
}

python_install() {
	# Distutils-r1/gpep517 può stampare warning setuptools su stderr.
	# Li filtriamo per evitare il QA Notice, senza nascondere altri errori.
	local tmp_stderr="${T}/python_install.stderr"

	# Esegui install catturando stderr
	( distutils-r1_python_install ) 2> "${tmp_stderr}" || die

	# Rimuovi SOLO i warning noti di setuptools sul package discovery
	sed -i \
		-e "/Package 'weaviate\./d" \
		-e "/is absent from the .*packages.* configuration\./d" \
		"${tmp_stderr}" || die

	# Se resta qualcosa su stderr, ristampalo (così non perdi warning reali)
	if [[ -s ${tmp_stderr} ]]; then
		cat "${tmp_stderr}" >&2
	fi
}
