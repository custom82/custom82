# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="jspdf"
inherit npm

DESCRIPTION="A library to generate PDFs in JavaScript."
HOMEPAGE="https://github.com/parallax/jsPDF"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/babel-runtime
        dev-nodejs/fast-png
        dev-nodejs/fflate
"
