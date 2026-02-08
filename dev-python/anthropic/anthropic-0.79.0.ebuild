EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )

DISTUTILS_USE_PEP517=setuptools
inherit distutils-r1

DESCRIPTION="Official Python library for the Anthropic (Claude) API"
HOMEPAGE="https://github.com/anthropics/anthropic-sdk-python"
SRC_URI="https://github.com/anthropics/anthropic-sdk-python/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

S="${WORKDIR}/anthropic-sdk-python-${PV}"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64"
IUSE="aiohttp bedrock vertex"
RESTRICT="test"

RDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/httpx-0.25.0[${PYTHON_USEDEP}]
		<dev-python/httpx-1[${PYTHON_USEDEP}]
		>=dev-python/pydantic-1.9.0[${PYTHON_USEDEP}]
		<dev-python/pydantic-3[${PYTHON_USEDEP}]
		>=dev-python/typing-extensions-4.10[${PYTHON_USEDEP}]
		<dev-python/typing-extensions-5[${PYTHON_USEDEP}]
		>=dev-python/anyio-3.5.0[${PYTHON_USEDEP}]
		<dev-python/anyio-5[${PYTHON_USEDEP}]
		>=dev-python/distro-1.7.0[${PYTHON_USEDEP}]
		<dev-python/distro-2[${PYTHON_USEDEP}]
		>=dev-python/jiter-0.4.0[${PYTHON_USEDEP}]
		<dev-python/jiter-1[${PYTHON_USEDEP}]
		>=dev-python/docstring-parser-0.15[${PYTHON_USEDEP}]
		<dev-python/docstring-parser-1[${PYTHON_USEDEP}]
		dev-python/sniffio[${PYTHON_USEDEP}]
	')
	aiohttp? (
		$(python_gen_cond_dep '
			dev-python/aiohttp[${PYTHON_USEDEP}]
			>=dev-python/httpx-aiohttp-0.1.9[${PYTHON_USEDEP}]
		')
	)
	vertex? (
		$(python_gen_cond_dep '
			>=dev-python/google-auth-2[requests,${PYTHON_USEDEP}]
			<dev-python/google-auth-3[${PYTHON_USEDEP}]
		')
	)
	bedrock? (
		$(python_gen_cond_dep '
			>=dev-python/boto3-1.28.57[${PYTHON_USEDEP}]
			>=dev-python/botocore-1.31.57[${PYTHON_USEDEP}]
		')
	)
"

BDEPEND="
	$(python_gen_cond_dep '
		>=dev-python/setuptools-61[${PYTHON_USEDEP}]
		>=dev-python/wheel-0[${PYTHON_USEDEP}]
	')
"
src_prepare() {
	default

	# 1) hatchling -> setuptools
	sed -i \
		-e 's|^requires = \["hatchling==1\.26\.3", "hatch-fancy-pypi-readme"\]$|requires = ["setuptools>=61", "wheel"]|' \
		-e 's|^build-backend = "hatchling\.build"$|build-backend = "setuptools.build_meta"|' \
		pyproject.toml || die

	# 2) dynamic readme -> static readme
	sed -i \
		-e 's|^dynamic = \["readme"\]$|readme = "README.md"|' \
		pyproject.toml || die

	# 3) rimuovi blocco fancy-pypi-readme
	sed -i '/^\[tool\.hatch\.metadata\.hooks\.fancy-pypi-readme\]/,/^\[tool\./d' pyproject.toml

	# 4) fix setuptools license classifier (PEP639)
	sed -i '/License :: OSI Approved :: MIT License/d' pyproject.toml || die
}
