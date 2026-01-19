# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=maturin
PYTHON_COMPAT=( python3_{12..14} )

inherit distutils-r1 cargo

DESCRIPTION="Embedding database for LLM apps"
HOMEPAGE="https://github.com/chroma-core/chroma"

GCLOUD_RUST_TAG="v20251222"
GCLOUD_RUST_PN="google-cloud-rust"
GCLOUD_RUST_P="${GCLOUD_RUST_PN}-${GCLOUD_RUST_TAG}"
GCLOUD_RUST_VER="20251222"

# Dal tuo errore: ...hnswlib.git?branch=master#312991cf
HNSWLIB_COMMIT="312991cf9e640d5ccab879906a51e7612ce6fcf1"
HNSWLIB_PN="hnswlib"
HNSWLIB_P="${HNSWLIB_PN}-${HNSWLIB_COMMIT}"

SRC_URI="
	https://github.com/chroma-core/chroma/archive/refs/tags/${PV}.tar.gz -> ${P}.tar.gz
	https://github.com/yoshidan/${GCLOUD_RUST_PN}/archive/refs/tags/${GCLOUD_RUST_TAG}.tar.gz -> ${GCLOUD_RUST_P}.tar.gz
	https://github.com/chroma-core/${HNSWLIB_PN}/archive/${HNSWLIB_COMMIT}.tar.gz -> ${HNSWLIB_P}.tar.gz
"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"

S="${WORKDIR}/chroma-${PV}"

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
	dev-python/importlib-resources[${PYTHON_USEDEP}]
	dev-python/graphlib-backport[${PYTHON_USEDEP}]
	dev-python/grpcio[${PYTHON_USEDEP}]
	dev-python/typer[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/mmh3[${PYTHON_USEDEP}]
	dev-python/orjson[${PYTHON_USEDEP}]
	dev-python/httpx[${PYTHON_USEDEP}]
	dev-python/rich[${PYTHON_USEDEP}]
	dev-python/jsonschema[${PYTHON_USEDEP}]
"
DEPEND="${RDEPEND}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RESTRICT="test"
distutils_enable_tests pytest

src_prepare() {
	default
	distutils-r1_src_prepare

	# Bundle google-cloud-rust sotto rust/
	local gcloud_src="${WORKDIR}/${GCLOUD_RUST_PN}-${GCLOUD_RUST_VER}"
	local gcloud_dst="${S}/rust/${GCLOUD_RUST_PN}"
	[[ -d "${gcloud_src}" ]] || die "google-cloud-rust sorgente non trovato: ${gcloud_src}"
	rm -rf "${gcloud_dst}" || die
	cp -a "${gcloud_src}" "${gcloud_dst}" || die

	# Bundle hnswlib sotto rust/
	local hnsw_src="${WORKDIR}/${HNSWLIB_PN}-${HNSWLIB_COMMIT}"
	local hnsw_dst="${S}/rust/${HNSWLIB_PN}"
	[[ -d "${hnsw_src}" ]] || die "hnswlib sorgente non trovato: ${hnsw_src}"
	rm -rf "${hnsw_dst}" || die
	cp -a "${hnsw_src}" "${hnsw_dst}" || die

	local cargo_toml="${S}/Cargo.toml"

	# --- Patch hnswlib: git -> path ---
	# originale:
	# hnswlib = { version = "0.8.2", git = "https://github.com/chroma-core/hnswlib.git", branch = "master" }
	# diventa:
	# hnswlib = { path = "rust/hnswlib", version = "0.8.2" }
	sed -i \
		-e 's|^hnswlib = { version = "0\.8\.2", git = "https://github\.com/chroma-core/hnswlib\.git", branch = "master" }|hnswlib = { path = "rust/hnswlib", version = "0.8.2" }|' \
		"${cargo_toml}" || die

	# --- Patch google-cloud-*: git -> path ---
	# NB: gax e' in foundation/gax
	sed -i \
		-e 's|^google-cloud-gax = { git = "https://github\.com/yoshidan/google-cloud-rust", tag = "v20251222", package = "gcloud-gax" }|google-cloud-gax = { path = "rust/'"${GCLOUD_RUST_PN}"'/foundation/gax", package = "gcloud-gax" }|' \
		"${cargo_toml}" || die

	sed -i \
		-e 's|^google-cloud-spanner = { git = "https://github\.com/yoshidan/google-cloud-rust", tag = "v20251222", package = "gcloud-spanner" }|google-cloud-spanner = { path = "rust/'"${GCLOUD_RUST_PN}"'/spanner", package = "gcloud-spanner" }|' \
		"${cargo_toml}" || die

	sed -i \
		-e 's|^google-cloud-googleapis = { git = "https://github\.com/yoshidan/google-cloud-rust", tag = "v20251222", package = "gcloud-googleapis", features = \["spanner"\] }|google-cloud-googleapis = { path = "rust/'"${GCLOUD_RUST_PN}"'/googleapis", package = "gcloud-googleapis", features = ["spanner"] }|' \
		"${cargo_toml}" || die

	# --- (Opzionale) aggiungi i crate gcloud ai members del workspace ---
	# così risultano "insieme agli altri crate" anche come members workspace.
	if ! grep -q 'rust/'"${GCLOUD_RUST_PN}"'/foundation/gax' "${cargo_toml}" ; then
		sed -i \
			-e 's|^\(members = \[\)|\1"rust/'"${GCLOUD_RUST_PN}"'/foundation/gax", "rust/'"${GCLOUD_RUST_PN}"'/spanner", "rust/'"${GCLOUD_RUST_PN}"'/googleapis", |' \
			"${cargo_toml}" || die
	fi

	# --- (Opzionale) aggiungi hnswlib ai members (non necessario per compilarla) ---
	if ! grep -q '"rust/hnswlib"' "${cargo_toml}" ; then
		sed -i \
			-e 's|^\(members = \[\)|\1"rust/hnswlib", |' \
			"${cargo_toml}" || die
	fi
}
