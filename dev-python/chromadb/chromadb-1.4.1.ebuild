# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1

DESCRIPTION="Embedding database for LLM apps"
HOMEPAGE="https://github.com/chroma-core"
SRC_URI="https://github.com/chroma-core/chroma/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz"


LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

S="${WORKDIR}/chroma-${PV}"

#	>=dev-python/build-1.0.3[${PYTHON_USEDEP}]
# FIXME: WiP, add missing deps
RDEPEND="
	dev-python/build[${PYTHON_USEDEP}]
	dev-python/pydantic[${PYTHON_USEDEP}]
	dev-python/pybase64[${PYTHON_USEDEP}]
	dev-python/uvicorn[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/posthog[${PYTHON_USEDEP}]
	dev-python/typing_extensions[${PYTHON_USEDEP}]
	sci-libs/onnxruntime[python${PYTHON_USEDEP}]
	dev-python/opentelemetry-api[${PYTHON_USEDEP}]
	dev-python/opentelemetry-exporter-otlp-proto-grpc[${PYTHON_USEDEP}]
	dev-python/opentelemetry-api[${PYTHON_USEDEP}]
	sci-ml/tokenizers[${PYTHON_USEDEP}]
	dev-python/pika[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/overrides[${PYTHON_USEDEP}]


"

#	>=dev-python/tokenizers-0.13.2[${PYTHON_USEDEP}]
#	>=dev-python/pypika-0.48.9[${PYTHON_USEDEP}]
#	>=dev-python/pybase64-1.4.1[${PYTHON_USEDEP}]
#	>=dev-python/posthog-2.4.0[${PYTHON_USEDEP}]
#	>=dev-python/onnxruntime-1.14.1[${PYTHON_USEDEP}]
#	>=dev-python/opentelemetry-exporter-otlp-proto-grpc-1.2.0[${PYTHON_USEDEP}]
#	>=dev-python/kubernetes-28.1.0[${PYTHON_USEDEP}]
#	>=dev-python/mmh3-4.0.1[${PYTHON_USEDEP}]

DEPEND="${RDEPEND}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RESTRICT="test"
#distutils_enable_tests pytest
