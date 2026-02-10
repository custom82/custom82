EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1

DESCRIPTION="OpenTelemetry OTLP Exporter common (protobuf) package"
HOMEPAGE="
	https://github.com/open-telemetry/opentelemetry-python
	https://opentelemetry.io/
"

SRC_URI="https://github.com/open-telemetry/opentelemetry-python/archive/refs/tags/v${PV}.tar.gz	-> opentelemetry-python-${PV}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"

S="${WORKDIR}/opentelemetry-python-${PV}/exporter/opentelemetry-exporter-otlp-proto-common"

RDEPEND="
	=dev-python/opentelemetry-api-${PV}[${PYTHON_USEDEP}]
	=dev-python/opentelemetry-proto-${PV}[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
"

BDEPEND="
	dev-python/hatchling[${PYTHON_USEDEP}]
"
