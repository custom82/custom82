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

src_prepare() {
	default
	npm install --ignore-scripts --no-audit --no-fund || die
}

src_compile() {
	export PATH="${S}/node_modules/.bin:${PATH}"
	npm run compile || die
}

src_install() {
	# layout standard Gentoo per moduli node
	insinto /usr/lib/node_modules/${PN}

	# runtime
	doins -r js ts || die

	# metadata
	doins package.json || die
	[[ -f README.md ]] && doins README.md
	[[ -f LICENSE ]] && doins LICENSE
	[[ -f LICENSE.txt ]] && doins LICENSE.txt
}
