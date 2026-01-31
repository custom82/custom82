# Copyright 1999-2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{10..13} )

# Se nel tuo ambiente DISTUTILS_USE_PEP517 è vuota, distutils-r1 va in die.
# Forziamo un valore valido.
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1 pypi

DESCRIPTION="Utility pure-Python per estrarre testo e immagini da file .docx"
HOMEPAGE="
	https://pypi.org/project/docx2txt/
	https://github.com/ankushshah89/python-docx2txt
"
LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RESTRICT="test"
