EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="OpenTelemetry Collector Protobuf over gRPC Exporter"
HOMEPAGE="
	https://github.com/open-telemetry/opentelemetry-python
	https://pypi.org/project/opentelemetry-exporter-otlp-proto-grpc/
"

SRC_URI="https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v${PV}.tar.gz -> opentelemetry-python-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

IUSE="gcp-auth test"
RESTRICT="!test? ( test )"

S="${WORKDIR}/opentelemetry-python-${PV}/exporter/opentelemetry-exporter-otlp-proto-grpc"

RDEPEND="
	>=dev-python/googleapis-common-protos-1.57[${PYTHON_USEDEP}]
	>=dev-python/typing-extensions-4.6.0[${PYTHON_USEDEP}]

	~dev-python/opentelemetry-api-${PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-sdk-${PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-proto-${PV}[${PYTHON_USEDEP}]
	~dev-python/opentelemetry-exporter-otlp-proto-common-${PV}[${PYTHON_USEDEP}]

	$(python_gen_cond_dep '
		>=dev-python/grpcio-1.63.2[${PYTHON_USEDEP}]
	' python3_11 python3_12)

	$(python_gen_cond_dep '
		>=dev-python/grpcio-1.66.2[${PYTHON_USEDEP}]
	' python3_13)

	$(python_gen_cond_dep '
		>=dev-python/grpcio-1.75.1[${PYTHON_USEDEP}]
	' python3_14)

	gcp-auth? (
		>=dev-python/opentelemetry-exporter-credential-provider-gcp-0.59_beta0[${PYTHON_USEDEP}]
	)
"

BDEPEND="
	test? (
		dev-python/pytest[${PYTHON_USEDEP}]
	)
"

python_test() {
	epytest -q
}
