EAPI=8

PYTHON_COMPAT=( python3_{11,12,13} )

inherit python-r1

DESCRIPTION="ONNX Runtime is a runtime accelerator for Machine Learning models"
HOMEPAGE="
	https://pypi.org/project/onnxruntime/
	https://onnxruntime.ai/
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
RESTRICT="test"

SRC_URI="
	amd64? (
		https://mirrors.aliyun.com/pypi/packages/e9/80/113381ba832d5e777accedc6cb41d10f9eca82321ae31ebb6bcede530cea/onnxruntime-1.23.2-cp311-cp311-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl -> ${P}-cp311.whl
		https://mirrors.aliyun.com/pypi/packages/ef/88/9cc25d2bafe6bc0d4d3c1db3ade98196d5b355c0b273e6a5dc09c5d5d0d5/onnxruntime-1.23.2-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl -> ${P}-cp312.whl
		https://mirrors.aliyun.com/pypi/packages/f2/2b/b57c8a2466a3126dbe0a792f56ad7290949b02f47b86216cd47d857e4b77/onnxruntime-1.23.2-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl -> ${P}-cp313.whl
	)
"

S="${WORKDIR}"

BDEPEND="
	dev-python/installer[${PYTHON_USEDEP}]
"

RDEPEND="
	dev-python/coloredlogs[${PYTHON_USEDEP}]
	dev-python/flatbuffers[${PYTHON_USEDEP}]
	dev-python/numpy[${PYTHON_USEDEP}]
	dev-python/packaging[${PYTHON_USEDEP}]
	dev-python/protobuf[${PYTHON_USEDEP}]
	dev-python/sympy[${PYTHON_USEDEP}]
"

QA_PREBUILT="*"

src_prepare() {
	default

	# "installer" richiede un filename wheel valido (PEP 427).
	# I file in DISTDIR li abbiamo rinominati a ${P}-cpXYZ.whl, che NON è valido.
	# Creiamo dei symlink con nomi wheel completi e validi.
	local w311="onnxruntime-1.23.2-cp311-cp311-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
	local w312="onnxruntime-1.23.2-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"
	local w313="onnxruntime-1.23.2-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl"

	ln -sf "${DISTDIR}/${P}-cp311.whl" "${WORKDIR}/${w311}" || die
	ln -sf "${DISTDIR}/${P}-cp312.whl" "${WORKDIR}/${w312}" || die
	ln -sf "${DISTDIR}/${P}-cp313.whl" "${WORKDIR}/${w313}" || die
}

src_compile() {
	:
}

_install_wheel_for_impl() {
	local wheel
	case "${EPYTHON}" in
		python3.11) wheel="onnxruntime-1.23.2-cp311-cp311-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl" ;;
		python3.12) wheel="onnxruntime-1.23.2-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl" ;;
		python3.13) wheel="onnxruntime-1.23.2-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl" ;;
		*) die "Nessun wheel disponibile per ${EPYTHON}" ;;
	esac

	"${EPYTHON}" -m installer \
		--destdir="${D}" \
		--prefix="${EPREFIX}/usr" \
		"${WORKDIR}/${wheel}" || die
}

src_install() {
	python_foreach_impl _install_wheel_for_impl
}
