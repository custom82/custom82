# Copyright 2026 Gentoo Authors
# Distributed under the terms of the GNU General Public License v2

EAPI=8

PYTHON_COMPAT=( python3_{11,12,13,14} )
DISTUTILS_USE_PEP517=setuptools

inherit distutils-r1

DESCRIPTION="Extract Outlook email messages and attachments from MSG files"
HOMEPAGE="https://github.com/scanny/python-oxmsg https://pypi.org/project/python-oxmsg/"
SRC_URI="https://github.com/scanny/python-oxmsg/archive/refs/tags/v${PV}.tar.gz -> ${P}.tar.gz"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

# upstream ha test ma spesso richiedono fixture; abilitali se vuoi
RESTRICT="test"

S="${WORKDIR}/python-oxmsg-${PV}"

RDEPEND="
	dev-python/click[${PYTHON_USEDEP}]
	dev-python/olefile[${PYTHON_USEDEP}]
	dev-python/typing-extensions[${PYTHON_USEDEP}]
"
