# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13} )

inherit webapp python-r1 systemd

DESCRIPTION="Open WebUI - self-hosted web UI for LLMs (Ollama/OpenAI compatible)"
HOMEPAGE="https://github.com/open-webui/open-webui"
SRC_URI="https://github.com/open-webui/open-webui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
KEYWORDS="~amd64 ~arm64"
IUSE="+ollama openai"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/uvicorn[${PYTHON_USEDEP}]
		dev-python/starlette[${PYTHON_USEDEP}]
		dev-python/pydantic[${PYTHON_USEDEP}]
		dev-python/pydantic-settings[${PYTHON_USEDEP}]
		dev-python/python-multipart[${PYTHON_USEDEP}]
		dev-python/requests[${PYTHON_USEDEP}]
		dev-python/aiohttp[${PYTHON_USEDEP}]
		dev-python/jinja2[${PYTHON_USEDEP}]
		dev-python/pyyaml[${PYTHON_USEDEP}]
		dev-python/typing-extensions[${PYTHON_USEDEP}]
		dev-python/websockets[${PYTHON_USEDEP}]
		dev-python/packaging[${PYTHON_USEDEP}]
		dev-python/python-dotenv[${PYTHON_USEDEP}]
		dev-python/sqlalchemy[${PYTHON_USEDEP}]
		dev-python/alembic[${PYTHON_USEDEP}]
		dev-python/passlib[${PYTHON_USEDEP}]
		dev-python/bcrypt[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/itsdangerous[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
		dev-python/typer[${PYTHON_USEDEP}]
		dev-python/aiocache[${PYTHON_USEDEP}]
		dev-python/starlette-compress[${PYTHON_USEDEP}]
		dev-python/starsessions[${PYTHON_USEDEP}]
		dev-python/loguru[${PYTHON_USEDEP}]
		dev-python/opentelemetry-api[${PYTHON_USEDEP}]
		dev-python/markdown[${PYTHON_USEDEP}]
		dev-python/pyjwt[${PYTHON_USEDEP}]
		dev-python/pytz[${PYTHON_USEDEP}]
		dev-python/peewee[${PYTHON_USEDEP}]
		dev-python/python-mimeparse[${PYTHON_USEDEP}]
		dev-python/authlib[${PYTHON_USEDEP}]
		dev-python/chromadb[${PYTHON_USEDEP}]
	')
	ollama? ( sci-ml/ollama )
"

DEPEND="${RDEPEND}"

need_httpd_cgi
RESTRICT="test"

S="${WORKDIR}/open-webui-${PV}"

src_configure() { :; }

src_compile() {
	einfo "Skipping build: upstream Makefile uses docker-compose; we install sources only."
}

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r backend || die
	doins CHANGELOG.md || die

	# CREA le directory hostroot prima
	keepdir "${MY_HOSTROOTDIR}/openwebui"
	keepdir "${MY_HOSTROOTDIR}/openwebui/data"
	keepdir "${MY_HOSTROOTDIR}/openwebui/log"

	# Ora puoi marcarle come scrivibili dal webserver
	webapp_serverowned "${MY_HOSTROOTDIR}/openwebui"
	webapp_serverowned "${MY_HOSTROOTDIR}/openwebui/data"
	webapp_serverowned "${MY_HOSTROOTDIR}/openwebui/log"

	webapp_src_install
	systemd_newunit "${FILESDIR}"/openwebui.service openwebui.service
}
