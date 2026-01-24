EAPI=8

inherit npm

DESCRIPTION="FlatBuffers is a cross platform serialization library (JS/TS runtime from google/flatbuffers)"
HOMEPAGE="https://github.com/google/flatbuffers"
SRC_URI="https://github.com/google/flatbuffers/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="test"

S="${WORKDIR}/flatbuffers-${PV}"

PATCHES=(
	"${FILESDIR}/flatbuffers-25.12.19-ts59-arraybufferlike.patch"
)

RDEPEND="net-libs/nodejs"

# build tools usati da "npm run compile": tsc + esbuild
BDEPEND="
	net-libs/nodejs
	dev-lang/typescript
	dev-nodejs/esbuild
"

# Se in futuro abiliti i test, aggiungi qui quello che serve davvero.
# RESTRICT="!test? ( test )"

NPM_MODULE="flatbuffers"

npm_src_unpack() {
	unpack "${A}"
}

npm_src_compile() {
	# sicurezza extra: se esbuild venisse usato da node_modules, lo trova comunque
	export PATH="${S}/node_modules/.bin:${PATH}"

	npm run compile || die
}

npm_src_install() {
	# install standard del modulo npm (fornito dalla tua npm.eclass)
	npm_src_install
}
