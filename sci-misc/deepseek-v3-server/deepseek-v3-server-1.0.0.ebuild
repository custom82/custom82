# Copyright 2025 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

# deepseek-v3-server-1.0.0.ebuild
# Complete DeepSeek-V3 server installation

EAPI=8

PYTHON_COMPAT=( python3_{10..14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 systemd cmake

DESCRIPTION="DeepSeek-V3 MoE Model Server with optimized inference"
HOMEPAGE="
	https://github.com/deepseek-ai/DeepSeek-V3
	https://huggingface.co/deepseek-ai
"

# Usiamo git per la versione più recente
EGIT_REPO_URI="https://github.com/deepseek-ai/DeepSeek-V3.git"
EGIT_BRANCH="main"
inherit git-r3

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64"
IUSE="
	cuda
	rocm
	+flash-attention-2
	flash-attention-3
	+vllm
	+tensorizer
	+awq
	+gptq
	+openai-api
	+rest-api
	+prometheus
	+docker
	fp16
	bf16
	int8
	int4
	+model-671b
	model-16b
	model-8b
"

REQUIRED_USE="
	^^ ( cuda rocm )
	flash-attention-3? ( cuda )
	awq? ( cuda )
	gptq? ( cuda )
"

# Dipendenze principali
RDEPEND="
	>=sci-ml/pytorch-2.3.0[${PYTHON_USEDEP}]
	>=dev-python/transformers-4.40.0[${PYTHON_USEDEP}]
	dev-python/accelerate[${PYTHON_USEDEP}]
	dev-python/safetensors[${PYTHON_USEDEP}]
	dev-python/tokenizers[${PYTHON_USEDEP}]
	dev-python/huggingface-hub[${PYTHON_USEDEP}]
	dev-python/protobuf-python[${PYTHON_USEDEP}]

	flash-attention-2? ( dev-python/flash-attn[${PYTHON_USEDEP}] )
	flash-attention-3? ( dev-python/flash-attn-v2[${PYTHON_USEDEP}] )

	vllm? ( dev-python/vllm[${PYTHON_USEDEP}] )
	tensorizer? ( dev-python/tensorizer[${PYTHON_USEDEP}] )

	awq? ( dev-python/autoawq[${PYTHON_USEDEP}] )
	gptq? ( dev-python/auto-gptq[${PYTHON_USEDEP}] )

	openai-api? ( >=dev-python/openai-1.12.0[${PYTHON_USEDEP}] )
	rest-api? (
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/websockets[${PYTHON_USEDEP}]
	)

	prometheus? (
		dev-python/prometheus-client[${PYTHON_USEDEP}]
		app-metrics/prometheus
	)

	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/scipy[${PYTHON_USEDEP}]
	dev-python/pandas[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	dev-python/psutil[${PYTHON_USEDEP}]
	dev-python/GPUtil[${PYTHON_USEDEP}]

	docker? ( app-containers/docker )
"

DEPEND="
	${RDEPEND}
	>=dev-cuda/cudnn-8.9[${PYTHON_USEDEP}]
	dev-libs/nvidia-nccl[${PYTHON_USEDEP}]
	dev-python/setuptools[${PYTHON_USEDEP}]
	dev-python/wheel[${PYTHON_USEDEP}]
	dev-python/build[${PYTHON_USEDEP}]
	virtual/pkgconfig
"

BDEPEND="
	sys-devel/make
	dev-util/cmake
	dev-util/ninja
	dev-vcs/git
"

CMAKE_BUILD_TYPE=Release

src_configure() {
	# Configurazioni specifiche per DeepSeek-V3
	local mycmakeargs=(
		-DBUILD_CUDA_EXTENSIONS=$(usex cuda ON OFF)
		-DUSE_FLASH_ATTENTION=$(usex flash-attention-2 ON OFF)
		-DUSE_FLASH_ATTENTION_V2=$(usex flash-attention-3 ON OFF)
		-DUSE_VLLM=$(usex vllm ON OFF)
		-DUSE_TENSORIZER=$(usex tensorizer ON OFF)
		-DUSE_OPENAI_API=$(usex openai-api ON OFF)
		-DWITH_PROMETHEUS=$(usex prometheus ON OFF)
	)

	cmake_src_configure
}

src_compile() {
	cmake_src_compile

	# Compila estensioni CUDA se abilitate
	if use cuda; then
		pushd "${S}/csrc" || die
		TORCH_CUDA_ARCH_LIST="7.0;7.5;8.0;8.6;8.9;9.0" python setup.py build_ext --inplace
		popd || die
	fi
}

src_install() {
	# Installa il pacchetto Python
	distutils-r1_src_install

	# Installa gli script di sistema
	exeinto /usr/bin
	doexe "${FILESDIR}"/deepseek-server
	doexe "${FILESDIR}"/deepseek-download
	doexe "${FILESDIR}"/deepseek-convert
	doexe "${FILESDIR}"/deepseek-benchmark

	# Configurazioni
	insinto /etc/deepseek
	newins "${FILESDIR}"/config.yaml config.yaml
	newins "${FILESDIR}"/models.yaml models.yaml

	# Systemd services
	systemd_dounit "${FILESDIR}"/deepseek-api.service
	systemd_dounit "${FILESDIR}"/deepseek-worker.service

	# Log rotation
	insinto /etc/logrotate.d
	newins "${FILESDIR}"/deepseek.logrotate deepseek

	# Directories
	keepdir /var/lib/deepseek/{models,cache,logs}
	keepdir /var/log/deepseek

	# Documentation
	dodoc "${S}"/README.md
	dodoc "${FILESDIR}"/INSTALL.gentoo
	dodoc "${FILESDIR}"/TROUBLESHOOTING.md

	# Create model directory with correct permissions
	fowners deepseek:deepseek /var/lib/deepseek /var/log/deepseek
	fperms 0750 /var/lib/deepseek /var/log/deepseek
}

pkg_postinst() {
	elog ""
	elog "╔══════════════════════════════════════════════════════════╗"
	elog "║           DeepSeek-V3 Server Installation Complete       ║"
	elog "╚══════════════════════════════════════════════════════════╝"
	elog ""
	elog "📦 Installation directories:"
	elog "   Models:      /var/lib/deepseek/models"
	elog "   Logs:        /var/log/deepseek"
	elog "   Configs:     /etc/deepseek"
	elog ""
	elog "🚀 Quick start:"
	elog "   1. Download a model:"
	elog "      deepseek-download --model deepseek-ai/DeepSeek-V3-Lite-16B"
	elog ""
	elog "   2. Start API server:"
	elog "      deepseek-server --model /var/lib/deepseek/models/deepseek-ai/DeepSeek-V3-Lite-16B"
	elog ""
	elog "   3. Or use systemd:"
	elog "      systemctl start deepseek-api"
	elog ""
	elog "🔧 Configuration:"
	elog "   Edit /etc/deepseek/config.yaml for server settings"
	elog "   Edit /etc/deepseek/models.yaml for model configurations"
	elog ""
	elog "📊 Monitoring:"
	elog "   API: http://localhost:8000/docs"
	elog "   Metrics: http://localhost:8000/metrics (if prometheus enabled)"
	elog ""
	elog "⚠️  IMPORTANT:"
	elog "   - Models require significant storage (16B ~40GB, 671B ~1.4TB)"
	elog "   - Configure GPU memory allocation in config.yaml"
	elog "   - Set HF_TOKEN environment variable for gated models"
	elog ""
}
