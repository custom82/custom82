EAPI=8

PYTHON_COMPAT=( python3_{10..13} )
inherit python-r1

DESCRIPTION="RapidOCR engine based on ONNXRuntime (PyPI wheel-only)"
HOMEPAGE="https://pypi.org/project/rapidocr-onnxruntime/"

SRC_URI="https://files.pythonhosted.org/packages/ba/12/1e5497183bdbe782dbb91bad1d0d2297dba4d2831b2652657f7517bfc6df/rapidocr_onnxruntime-1.4.4-py3-none-any.whl"
S="${WORKDIR}"

LICENSE="Apache-2.0"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="test"

BDEPEND="app-arch/unzip"

RDEPEND="
	${PYTHON_DEPS}
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/pillow[${PYTHON_USEDEP}]
	dev-python/pyclipper[${PYTHON_USEDEP}]
	dev-python/pyyaml[${PYTHON_USEDEP}]
	dev-python/shapely[${PYTHON_USEDEP}]
	dev-python/six[${PYTHON_USEDEP}]
	dev-python/tqdm[${PYTHON_USEDEP}]
	media-libs/opencv[python,${PYTHON_USEDEP}]
	sci-libs/onnxruntime[${PYTHON_USEDEP}]
"

src_prepare() { default; }
src_configure() { :; }
src_compile() { :; }

# niente unpack qui: lo facciamo per-impl in python_install per evitare "Skipping unpack"
src_unpack() { :; }

python_install() {
	local impldir="${WORKDIR}/wheel-${EPYTHON}"
	rm -rf "${impldir}" || die
	mkdir -p "${impldir}" || die

	# Estrai il wheel (zip) in una dir dedicata per quell'impl
	unzip -q "${DISTDIR}/rapidocr_onnxruntime-1.4.4-py3-none-any.whl" -d "${impldir}" || die

	local sitedir
	sitedir="$(python_get_sitedir)" || die

	insinto "${sitedir}"

	# La directory del pacchetto può essere rapidocr_onnxruntime oppure rapidocr_onnxruntime (underscore)
	# oppure avere nomi leggermente diversi; quindi installiamo le top-level python packages presenti.
	local pkgdir
	if [[ -d "${impldir}/rapidocr_onnxruntime" ]]; then
		pkgdir="rapidocr_onnxruntime"
	elif [[ -d "${impldir}/rapidocr-onnxruntime" ]]; then
		pkgdir="rapidocr-onnxruntime"
	else
		# fallback: cerca qualunque dir top-level che contenga __init__.py
		pkgdir=""
		local d
		for d in "${impldir}"/*; do
			[[ -d "${d}" && -f "${d}/__init__.py" ]] || continue
			pkgdir="$(basename "${d}")"
			break
		done
		[[ -n "${pkgdir}" ]] || die "No top-level python package dir found inside wheel"
	fi

	doins -r "${impldir}/${pkgdir}" || die

	# dist-info
	local di
	for di in "${impldir}"/*.dist-info; do
		[[ -e "${di}" ]] || continue
		doins -r "${di}" || die
	done

	# eventuale .data/purelib
	local data
	for data in "${impldir}"/*.data; do
		[[ -d "${data}/purelib" ]] || continue
		doins -r "${data}/purelib/"* || die
	done
}

src_install() {
	python_foreach_impl python_install
}
