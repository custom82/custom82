EAPI=8

DISTUTILS_USE_PEP517=no
DISTUTILS_SINGLE_IMPL=1

PYTHON_COMPAT=( python3_{11..14} )

inherit distutils-r1

DESCRIPTION="Fast inference engine for Transformer models (Python bindings)"
HOMEPAGE="https://pypi.org/project/ctranslate2/ https://opennmt.net/CTranslate2/"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~arm64"

# 4.7.1 su PyPI: niente sdist, solo wheel. :contentReference[oaicite:1]{index=1}
SRC_URI="
	python_single_target_python3_11? (
		amd64? (
			https://files.pythonhosted.org/packages/ed/4e/b48f79fd36e5d3c7e12db383aa49814c340921a618ef7364bd0ced670644/ctranslate2-4.7.1-cp311-cp311-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
				-> ctranslate2-4.7.1-cp311-cp311-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
		)
		arm64? (
			https://files.pythonhosted.org/packages/0a/a7/494a66bb02c7926331cadfff51d5ce81f5abfb1e8d05d7f2459082f31b48/ctranslate2-4.7.1-cp311-cp311-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
				-> ctranslate2-4.7.1-cp311-cp311-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
		)
	)
	python_single_target_python3_12? (
		amd64? (
			https://files.pythonhosted.org/packages/b3/86/428d270fd72117d19fb48ed3211aa8a3c8bd7577373252962cb634e0fd01/ctranslate2-4.7.1-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
				-> ctranslate2-4.7.1-cp312-cp312-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
		)
		arm64? (
			https://files.pythonhosted.org/packages/0d/38/37f5a125f623bbc81ad5dd6f6141c95f0c1051c180669d2a83a44b44b518/ctranslate2-4.7.1-cp312-cp312-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
				-> ctranslate2-4.7.1-cp312-cp312-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
		)
	)
	python_single_target_python3_13? (
		amd64? (
			https://files.pythonhosted.org/packages/0b/03/4e3728ce29d192ee75ed9a2d8589bf4f19edafe5bed3845187de51b179a3/ctranslate2-4.7.1-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
				-> ctranslate2-4.7.1-cp313-cp313-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
		)
		arm64? (
			https://files.pythonhosted.org/packages/7d/49/1a3b7bdb383aa49814c340921a618ef7364bd0ced67064495f0c1051c180/ctranslate2-4.7.1-cp313-cp313-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
				-> ctranslate2-4.7.1-cp313-cp313-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
		)
	)
	python_single_target_python3_14? (
		amd64? (
			https://files.pythonhosted.org/packages/80/11/6474893b07121057035069a0a483fe1cd8c47878213f282afb4c0c6fc275/ctranslate2-4.7.1-cp314-cp314-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
				-> ctranslate2-4.7.1-cp314-cp314-manylinux_2_27_x86_64.manylinux_2_28_x86_64.whl
		)
		arm64? (
			https://files.pythonhosted.org/packages/ac/33/b8eb3acc67bbca4d9872fc9ff94db78e6167a7ba5cd932f585d1560effc7/ctranslate2-4.7.1-cp314-cp314-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
				-> ctranslate2-4.7.1-cp314-cp314-manylinux_2_27_aarch64.manylinux_2_28_aarch64.whl
		)
	)
"

S="${WORKDIR}"

RESTRICT="test"

BDEPEND="app-arch/unzip"
RDEPEND="${PYTHON_DEPS}"

src_unpack() { :; }

python_install() {
	local cp arch wheel

	case "${EPYTHON}" in
		python3.11) cp="cp311" ;;
		python3.12) cp="cp312" ;;
		python3.13) cp="cp313" ;;
		python3.14) cp="cp314" ;;
		*) die "EPYTHON non supportato: ${EPYTHON}" ;;
	esac

	case "${ARCH}" in
		amd64) arch="x86_64" ;;
		arm64) arch="aarch64" ;;
		*) die "ARCH non supportata: ${ARCH}" ;;
	esac

	wheel="${P}-${cp}-${cp}-manylinux_2_27_${arch}.manylinux_2_28_${arch}.whl"
	[[ -f "${DISTDIR}/${wheel}" ]] || die "Wheel non trovata in DISTDIR: ${wheel}"

	distutils_wheel_install "${D}" "${DISTDIR}/${wheel}"
}
