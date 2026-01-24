EAPI=8

inherit npm

DESCRIPTION="FlatBuffers JavaScript/TypeScript runtime from google/flatbuffers"
HOMEPAGE="https://github.com/google/flatbuffers"
SRC_URI="https://github.com/google/flatbuffers/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"

S="${WORKDIR}/flatbuffers-${PV}"

PATCHES=(
	"${FILESDIR}/${P}-ts59-arraybufferlike.patch"
)

RDEPEND="net-libs/nodejs"

BDEPEND="
	net-libs/nodejs
	dev-lang/typescript
	dev-nodejs/esbuild
"

NPM_EXTRA_FILES="js mjs ts"

npm_src_unpack() {
    unpack "${A}"
}

npm_src_compile() {
    npm run compile

}
