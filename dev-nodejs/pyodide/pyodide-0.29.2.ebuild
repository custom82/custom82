# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="pyodide"
inherit npm

DESCRIPTION="Download and extract Pyodide packages from Github releases"
HOMEPAGE="https://github.com/pyodide/pyodide"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/types-emscripten
        dev-nodejs/ws
"
