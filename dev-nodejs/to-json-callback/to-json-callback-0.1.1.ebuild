# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="to-json-callback"
inherit npm

DESCRIPTION="Did you know that some function in JS can't be serialized as string and be evaluated as such somewhere else"
HOMEPAGE="https://github.com/WebReflection/to-json-callback"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="index.js esm cjs es.js"
