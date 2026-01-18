# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11..14} )

inherit webapp python-r1

DESCRIPTION="Open WebUI - self-hosted web UI for LLMs (Ollama/OpenAI compatible)"
HOMEPAGE="https://github.com/open-webui/open-webui"
SRC_URI="https://github.com/open-webui/open-webui/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"
IUSE="+ollama openai"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

RDEPEND="
	${PYTHON_DEPS}
	$(python_gen_cond_dep '
		dev-python/fastapi[${PYTHON_USEDEP}]
		dev-python/uvicorn[standard,${PYTHON_USEDEP}]
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
		dev-python/passlib[bcrypt,${PYTHON_USEDEP}]
		dev-python/bcrypt[${PYTHON_USEDEP}]
		dev-python/cryptography[${PYTHON_USEDEP}]
		dev-python/itsdangerous[${PYTHON_USEDEP}]
		dev-python/httpx[${PYTHON_USEDEP}]
	')
	ollama? ( sci-ml/ollama )
"

DEPEND="${RDEPEND}"

need_httpd_cgi
RESTRICT="test"

S="${WORKDIR}/open-webui-${PV}"

src_install() {
	webapp_src_preinst

	insinto "${MY_HTDOCSDIR}"
	doins -r backend frontend || die

	webapp_serverowned "${MY_HOSTROOTDIR}/openwebui"
	webapp_serverowned "${MY_HOSTROOTDIR}/openwebui/data"
	webapp_serverowned "${MY_HOSTROOTDIR}/openwebui/log"

	webapp_postinst_txt en "${FILESDIR}/postinstall-en.txt"
	webapp_postupgrade_txt en "${FILESDIR}/postupgrade-en.txt"

	webapp_src_install
}

pkg_postinst() {
	webapp_pkg_postinst

	elog
	elog "Open WebUI files installed under:"
	elog "  ${VHOST_ROOT}${MY_HTDOCSDIR}"
	elog
	elog "Writable runtime dirs (per-vhost) created under:"
	elog "  ${VHOST_ROOT}${MY_HOSTROOTDIR}/openwebui/{data,log}"
	elog
	elog "To run it you still need to start the Python ASGI app, e.g.:"
	elog "  cd ${VHOST_ROOT}${MY_HTDOCSDIR}/backend"
	elog "  WEBUI_DATA_DIR=${VHOST_ROOT}${MY_HOSTROOTDIR}/openwebui/data \\"
	elog "  uvicorn open_webui.main:app --host 127.0.0.1 --port 8080"
	elog
	elog "Then reverse-proxy your vhost to http://127.0.0.1:8080 (nginx/caddy/apache)."
	elog
}
