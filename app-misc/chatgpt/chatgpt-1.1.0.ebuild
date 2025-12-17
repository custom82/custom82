EAPI=8

DESCRIPTION="Desktop application for ChatGPT (Linux, macOS & Windows) by lencx"
HOMEPAGE="https://github.com/lencx/ChatGPT"
SRC_URI="https://github.com/lencx/ChatGPT/archive/refs/tags/release-v${PV}.tar.gz -> ${P}.tar.gz
		https://github.com/tauri-apps/tauri/archive/refs/tags/tauri-v2.9.3.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE=""
S="${WORKDIR}/ChatGPT-release-v${PV}"

DEPEND="dev-rust/cargo"  # Assicurati che il pacchetto cargo esista in Portage

RDEPEND="${DEPEND}
		dev-rust/tauri
		dev-rust/rust-ls
		x11-libs/gdkpixbuf
		x11-libs/gtk+"

src_unpack() {
	default
	# rename folder if necessary
	mv "${WORKDIR}/ChatGPT-${PV}" "${WORKDIR}/${P}"
}

src_compile() {
	cd "${WORKDIR}/${P}"

	# Esegui la build con cargo
	cargo build --release --locked
}

src_install() {
	cd "${WORKDIR}/${P}"

	# Installa il binario
	local BINARY="target/release/chatgpt"
	if [[ -x ${BINARY} ]]; then
		dodir /usr/bin
		dobin ${BINARY}
	fi

	# Installa il file desktop
	dodir /usr/share/applications
	doins "src/desktop/chatgpt.desktop"

	# Installa l'icona
	dodir /usr/share/icons/hicolor/256x256/apps
	doins "src/assets/icon256.png" "usr"
}
