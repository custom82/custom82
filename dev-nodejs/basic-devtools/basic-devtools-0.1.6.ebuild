# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="basic-devtools"
inherit npm

DESCRIPTION="Exports $, $$, and $x utilities as described in Chrome Console Utilities API reference"
HOMEPAGE="https://github.com/WebReflection/basic-devtools"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="index.js esm types es.js"
