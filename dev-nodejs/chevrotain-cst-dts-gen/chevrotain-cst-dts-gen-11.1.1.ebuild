# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@chevrotain/cst-dts-gen"
inherit npm

DESCRIPTION="Chevrotain is a blazing fast and feature rich Parser Building Toolkit for JavaScript with built-in support for LL Grammars and 3rd party plugin for LL grammars"
HOMEPAGE="https://github.com/Chevrotain/chevrotain"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/chevrotain-gast
        dev-nodejs/chevrotain-types
        dev-nodejs/lodash-es
"
