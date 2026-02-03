# openwebui-0.7.2.ebuild
EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=hatchling

inherit distutils-r1 systemd

DESCRIPTION="Open WebUI - User-friendly interface for LLMs (GitHub source build with frontend)"
HOMEPAGE="https://github.com/open-webui/open-webui"

# GitHub tag tarball (full source, includes frontend)
SRC_URI="https://github.com/open-webui/open-webui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/open-webui-${PV}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

IUSE="
	+frontend
	pyodide
	postgres
	+redis
	+chroma
	+opensearch
	+whisper
	+ocr
	+transformers
	+rag
	test
"

RESTRICT="!test? ( test )"

# -------------------------
# Backend (Python) runtime
# -------------------------
RDEPEND="
	${PYTHON_DEPS}

	>=dev-python/fastapi-0.128.0[${PYTHON_USEDEP}]
	>=dev-python/uvicorn-0.40.0[${PYTHON_USEDEP}]
	>=dev-python/pydantic-2.12.5[${PYTHON_USEDEP}]
	>=dev-python/python-multipart-0.0.21[${PYTHON_USEDEP}]
	>=dev-python/itsdangerous-2.2.0[${PYTHON_USEDEP}]

	>=dev-python/python-socketio-5.16.0[${PYTHON_USEDEP}]
	>=dev-python/python-jose-3.5.0[${PYTHON_USEDEP}]
	dev-python/cryptography[${PYTHON_USEDEP}]
	>=dev-python/bcrypt-5.0.0[${PYTHON_USEDEP}]
	>=dev-python/argon2-cffi-25.1.0[${PYTHON_USEDEP}]
	>=dev-python/pyjwt-2.10.0[${PYTHON_USEDEP}]
	>=dev-python/authlib-1.6.6[${PYTHON_USEDEP}]

	>=dev-python/requests-2.32.5[${PYTHON_USEDEP}]
	>=dev-python/aiohttp-3.13.2[${PYTHON_USEDEP}]
	dev-python/async-timeout[${PYTHON_USEDEP}]
	dev-python/aiocache[${PYTHON_USEDEP}]
	dev-python/aiofiles[${PYTHON_USEDEP}]
	>=dev-python/starlette-compress-1.6.1[${PYTHON_USEDEP}]
	>=dev-python/httpx-0.28.1[cli,${PYTHON_USEDEP}]
	>=dev-python/starsessions-2.2.1[${PYTHON_USEDEP}]
	>=dev-python/python-mimeparse-2.0.0[${PYTHON_USEDEP}]

	>=dev-python/sqlalchemy-2.0.45[${PYTHON_USEDEP}]
	>=dev-python/alembic-1.18.1[${PYTHON_USEDEP}]
	>=dev-python/peewee-3.19.0[${PYTHON_USEDEP}]
	>=dev-python/peewee-migrate-1.14.3[${PYTHON_USEDEP}]

	>=dev-python/pycrdt-0.12.44[${PYTHON_USEDEP}]
	redis? ( dev-db/redis )

	>=dev-python/apscheduler-3.11.2[${PYTHON_USEDEP}]
	>=dev-python/restrictedpython-8.1[${PYTHON_USEDEP}]

	>=dev-python/loguru-0.7.3[${PYTHON_USEDEP}]
	>=dev-python/asgiref-3.11.0[${PYTHON_USEDEP}]

	dev-python/tiktoken[${PYTHON_USEDEP}]
	>=dev-python/mcp-1.25.0[${PYTHON_USEDEP}]

	dev-python/openai[${PYTHON_USEDEP}]
	dev-python/anthropic[${PYTHON_USEDEP}]
	>=dev-python/google-genai-1.59.0[${PYTHON_USEDEP}]

	>=dev-python/langchain-1.2.4[${PYTHON_USEDEP}]
	>=dev-python/langchain-community-0.4.1[${PYTHON_USEDEP}]
	>=dev-python/langchain-classic-1.0.1[${PYTHON_USEDEP}]
	>=dev-python/langchain-text-splitters-1.1.0[${PYTHON_USEDEP}]

	>=dev-python/fake-useragent-2.2.0[${PYTHON_USEDEP}]
	chroma? ( >=dev-python/chromadb-1.4.1[${PYTHON_USEDEP}] )
	opensearch? ( >=dev-python/opensearch-py-3.1.0[${PYTHON_USEDEP}] )
	>=dev-python/pymysql-1.1.2[${PYTHON_USEDEP}]
	>=dev-python/boto3-1.42.29[${PYTHON_USEDEP}]

	transformers? (
		>=dev-python/transformers-4.57.6[${PYTHON_USEDEP}]
		>=dev-python/sentence-transformers-5.2.0[${PYTHON_USEDEP}]
		>=dev-python/huggingface-hub-0.34.0[${PYTHON_USEDEP}]
		dev-python/accelerate[${PYTHON_USEDEP}]
		>=dev-python/pyarrow-20.0.0[${PYTHON_USEDEP}]
		>=dev-python/einops-0.8.1[${PYTHON_USEDEP}]
	)

	rag? (
		>=dev-python/ftfy-6.3.1[${PYTHON_USEDEP}]
		>=dev-python/chardet-5.2.0[${PYTHON_USEDEP}]
		>=dev-python/pypdf-6.6.0[${PYTHON_USEDEP}]
		>=dev-python/fpdf2-2.8.5[${PYTHON_USEDEP}]
		>=dev-python/pymdown-extensions-10.20[${PYTHON_USEDEP}]
		>=dev-python/docx2txt-0.9[${PYTHON_USEDEP}]
		>=dev-python/python-pptx-1.0.2[${PYTHON_USEDEP}]
		>=dev-python/unstructured-0.18.27[${PYTHON_USEDEP}]
		>=dev-python/msoffcrypto-tool-5.4.2[${PYTHON_USEDEP}]
		>=dev-python/nltk-3.9.2[${PYTHON_USEDEP}]
		>=dev-python/markdown-3.10[${PYTHON_USEDEP}]
		app-text/pandoc
		>=dev-python/pypandoc-1.16.2[${PYTHON_USEDEP}]
		>=dev-python/pandas-2.3.3[${PYTHON_USEDEP}]
		>=dev-python/openpyxl-3.1.5[${PYTHON_USEDEP}]
		>=dev-python/pyxlsb-1.0.10[${PYTHON_USEDEP}]
		>=dev-python/xlrd-2.0.2[${PYTHON_USEDEP}]
		>=dev-python/validators-0.35.0[${PYTHON_USEDEP}]
		dev-python/psutil[${PYTHON_USEDEP}]
		dev-python/sentencepiece[${PYTHON_USEDEP}]
		media-libs/libsndfile
		>=dev-python/soundfile-0.13.1[${PYTHON_USEDEP}]
		>=dev-python/azure-ai-documentintelligence-1.0.2[${PYTHON_USEDEP}]
	)

	>=media-gfx/pillow-12.1.0[${PYTHON_USEDEP}]
	ocr? (
		>=media-libs/opencv-4.12.0[python,${PYTHON_USEDEP}]
		>=dev-python/rapidocr-onnxruntime-1.4.4[${PYTHON_USEDEP}]
		>=dev-python/rank-bm25-0.2.2[${PYTHON_USEDEP}]
	)

	whisper? (
		>=dev-python/onnxruntime-1.23.2[${PYTHON_USEDEP}]
		>=dev-python/faster-whisper-1.2.1[${PYTHON_USEDEP}]
	)

	>=dev-python/black-25.12.0[${PYTHON_USEDEP}]
	>=dev-python/youtube-transcript-api-1.2.3[${PYTHON_USEDEP}]
	>=dev-python/pytube-15.0.0[${PYTHON_USEDEP}]
	dev-python/pydub[${PYTHON_USEDEP}]
	>=dev-python/ddgs-9.10.0[${PYTHON_USEDEP}]

	dev-python/google-api-python-client[${PYTHON_USEDEP}]
	dev-python/google-auth-httplib2[${PYTHON_USEDEP}]
	dev-python/google-auth-oauthlib[${PYTHON_USEDEP}]

	>=dev-python/googleapis-common-protos-1.72.0[${PYTHON_USEDEP}]
	>=dev-python/google-cloud-storage-3.8.0[${PYTHON_USEDEP}]

	>=dev-python/azure-identity-1.25.1[${PYTHON_USEDEP}]
	>=dev-python/azure-storage-blob-12.28.0[${PYTHON_USEDEP}]

	>=dev-python/ldap3-2.9.1[${PYTHON_USEDEP}]

	postgres? (

		dev-python/psycopg:2[${PYTHON_USEDEP}]
		dev-python/pgvector[${PYTHON_USEDEP}]
	)
"

DEPEND="${RDEPEND}"

# -------------------------
# Build-time deps
# -------------------------
BDEPEND="
	${PYTHON_DEPS}
	dev-python/hatchling[${PYTHON_USEDEP}]

	frontend? (
		>=net-libs/nodejs-18


		dev-nodejs/azure-msal-browser
		dev-nodejs/codemirror-lang-javascript
		dev-nodejs/codemirror-lang-python
		dev-nodejs/codemirror-language-data
		dev-nodejs/codemirror-theme-one-dark
		dev-nodejs/floating-ui-dom
		dev-nodejs/huggingface-transformers
		dev-nodejs/joplin-turndown-plugin-gfm
		dev-nodejs/mediapipe-tasks-vision
		dev-nodejs/pyscript-core
		dev-nodejs/sveltejs-adapter-node
		dev-nodejs/sveltejs-svelte-virtual-list
		dev-nodejs/tiptap-core
		dev-nodejs/tiptap-extension-bubble-menu
		dev-nodejs/tiptap-extension-code-block-lowlight
		dev-nodejs/tiptap-extension-drag-handle
		dev-nodejs/tiptap-extension-file-handler
		dev-nodejs/tiptap-extension-floating-menu
		dev-nodejs/tiptap-extension-highlight
		dev-nodejs/tiptap-extension-image
		dev-nodejs/tiptap-extension-link
		dev-nodejs/tiptap-extension-list
		dev-nodejs/tiptap-extension-mention
		dev-nodejs/tiptap-extension-table
		dev-nodejs/tiptap-extension-typography
		dev-nodejs/tiptap-extension-youtube
		dev-nodejs/tiptap-extensions
		dev-nodejs/tiptap-pm
		dev-nodejs/tiptap-starter-kit
		dev-nodejs/xyflow-svelte

		dev-nodejs/alpinejs
		dev-nodejs/async
		dev-nodejs/bits-ui
		dev-nodejs/chart-js
		dev-nodejs/codemirror
		dev-nodejs/codemirror-lang-elixir
		dev-nodejs/codemirror-lang-hcl
		dev-nodejs/dayjs
		dev-nodejs/dompurify
		dev-nodejs/eventsource-parser
		dev-nodejs/file-saver
		dev-nodejs/focus-trap
		dev-nodejs/fuse-js
		dev-nodejs/heic2any
		dev-nodejs/highlight-js
		dev-nodejs/html-entities
		dev-nodejs/html2canvas-pro
		dev-nodejs/i18next
		dev-nodejs/i18next-browser-languagedetector
		dev-nodejs/i18next-resources-to-backend
		dev-nodejs/idb
		dev-nodejs/js-sha256
		dev-nodejs/jspdf
		dev-nodejs/katex
		dev-nodejs/kokoro-js
		dev-nodejs/leaflet
		dev-nodejs/lowlight
		dev-nodejs/mammoth
		dev-nodejs/marked
		dev-nodejs/mermaid
		dev-nodejs/paneforge
		dev-nodejs/panzoom
		dev-nodejs/pdfjs-dist
		dev-nodejs/prosemirror-collab
		dev-nodejs/prosemirror-commands
		dev-nodejs/prosemirror-example-setup
		dev-nodejs/prosemirror-history
		dev-nodejs/prosemirror-keymap
		dev-nodejs/prosemirror-markdown
		dev-nodejs/prosemirror-model
		dev-nodejs/prosemirror-schema-basic
		dev-nodejs/prosemirror-schema-list
		dev-nodejs/prosemirror-state
		dev-nodejs/prosemirror-tables
		dev-nodejs/prosemirror-view
		dev-nodejs/pyodide
		dev-nodejs/socket-io-client
		dev-nodejs/sortablejs
		dev-nodejs/svelte-sonner
		dev-nodejs/tippy-js
		dev-nodejs/turndown
		dev-nodejs/turndown-plugin-gfm
		dev-nodejs/undici
		dev-nodejs/uuid
		dev-nodejs/vega
		dev-nodejs/vega-lite
		dev-nodejs/vite-plugin-static-copy
		dev-nodejs/xlsx
		dev-nodejs/y-prosemirror
		dev-nodejs/y-protocols
		dev-nodejs/yaml
		dev-nodejs/yjs


		dev-nodejs/sveltejs-adapter-auto
		dev-nodejs/sveltejs-adapter-static
		dev-nodejs/sveltejs-kit
		dev-nodejs/sveltejs-vite-plugin-svelte
		dev-nodejs/tailwindcss-container-queries
		dev-nodejs/tailwindcss-postcss
		dev-nodejs/tailwindcss-typography
		dev-nodejs/typescript-eslint-eslint-plugin
		dev-nodejs/typescript-eslint-parser
		dev-nodejs/i18next-parser
		dev-nodejs/eslint
		dev-nodejs/eslint-config-prettier
		dev-nodejs/eslint-plugin-cypress
		dev-nodejs/eslint-plugin-svelte
		dev-nodejs/postcss
		dev-nodejs/prettier
		dev-nodejs/prettier-plugin-svelte
		dev-nodejs/sass-embedded
		dev-nodejs/svelte
		dev-nodejs/svelte-check
		dev-nodejs/svelte-confetti
		dev-nodejs/tailwindcss
		dev-nodejs/tslib


		>=dev-nodejs/vite-5.4.21
		<dev-nodejs/vite-6
		dev-nodejs/vitest
		dev-nodejs/cypress
	)
"

# -------------------------
# Helpers (system node_modules, incl. scoped)
# -------------------------
npm_libdir() {
	[[ -d /usr/lib64/node_modules ]] && echo /usr/lib64/node_modules || echo /usr/lib/node_modules
}

npm_bin_path() {
	# $1 = module path (can be scoped e.g. @sveltejs/kit)
	# $2 = bin command name (e.g. svelte-kit / vite)
	local nm="$(npm_libdir)"
	local mod="$1"
	local cmd="$2"

	local rel
	rel="$(node -p "
		const p='${nm}/${mod}/package.json';
		const j=require(p);
		const b=j.bin;
		if (!b) process.exit(2);
		if (typeof b === 'string') { console.log(b); }
		else { console.log(b['${cmd}']); }
	" 2>/dev/null)" || die "cannot read bin for ${mod} (${cmd})"

	[[ -n ${rel} ]] || die "bin entry empty for ${mod}:${cmd}"
	echo "${nm}/${mod}/${rel}"
}

npm_bin_run() {
	local mod="$1"; shift
	local cmd="$1"; shift
	local nm="$(npm_libdir)"

	export NODE_PATH="${nm}"
	export NODE_OPTIONS="--preserve-symlinks --preserve-symlinks-main"
	export CI=1

	local bin
	bin="$(npm_bin_path "${mod}" "${cmd}")" || die
	node "${bin}" "$@" || die "failed: ${cmd} $*"
}

src_prepare() {
	distutils-r1_src_prepare

	# Gentoo: non vogliamo pin stretti '==' e '~=' dentro pyproject (root)
	# perché stai gestendo versions tramite dipendenze Portage.
	sed -i -e 's/==/>=/g' -e 's/~=/>=/g' pyproject.toml || die

	# IMPORTANTISSIMO: disabilita lo step pyodide:fetch che scarica roba da internet.
	# (noi al massimo copiamo i file di pyodide già installati come pacchetto)
	sed -i \
		-e 's/"build": *"npm run pyodide:fetch && vite build"/"build": "vite build"/' \
		-e 's/"dev": *"npm run pyodide:fetch && vite dev/"dev": "vite dev/' \
		-e 's/"dev:5050": *"npm run pyodide:fetch && vite dev/"dev:5050": "vite dev/' \
		-e 's/"build:watch": *"npm run pyodide:fetch && vite build/"build:watch": "vite build/' \
		package.json || die

	eapply_user
}

src_compile() {
	if use frontend; then
		# Se richiesto: copia solo i file base di pyodide dal pacchetto npm di sistema.
		# (niente micropip.install => niente download)
		if use pyodide; then
			local nm="$(npm_libdir)"
			if [[ -d "${nm}/pyodide" ]]; then
				mkdir -p static/pyodide || die
				cp -a "${nm}/pyodide/." static/pyodide/ || die
			else
				ewarn "pyodide USE flag attivo ma ${nm}/pyodide non esiste"
			fi
		fi

		# SvelteKit spesso beneficia di sync prima del build
		npm_bin_run "@sveltejs/kit" "svelte-kit" sync

		# Build frontend (output in ./build)
		npm_bin_run "vite" "vite" build

		# Sanity check: hatchling vuole includere ./build
		[[ -d build ]] || die "vite build non ha creato ./build (controlla config)"
	fi

	distutils-r1_src_compile
}

src_test() {
	epytest
}

src_install() {
	# distutils-r1 installerà il wheel che include:
	# - sources = ["backend"]
	# - force-include build -> open_webui/frontend
	distutils-r1_src_install

	# Config
	insinto /etc/${PN}
	if [[ -f backend/.env.example ]]; then
		newins backend/.env.example .env
	fi

	keepdir /var/lib/${PN}
	keepdir /var/log/${PN}

	systemd_dounit "${FILESDIR}/${PN}.service"
	newinitd "${FILESDIR}/${PN}.initd" ${PN}
	newconfd "${FILESDIR}/${PN}.confd" ${PN}
}

pkg_postinst() {
	elog "OpenWebUI installato (sorgenti GitHub + frontend buildato)."
	elog "Config: /etc/${PN}/.env"
	elog "Dati:   /var/lib/${PN}"
	elog "Log:    /var/log/${PN}"
	use frontend || ewarn "USE=-frontend: avrai verosimilmente modalità 'API only'."
	use pyodide || ewarn "USE=-pyodide: niente bundle pyodide offline (evitiamo download)."
}
