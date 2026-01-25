# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="sticky-module"
inherit npm

DESCRIPTION="A Symbol based leaky utility to store or retrieve a module"
HOMEPAGE="https://github.com/WebReflection/sticky-module"


LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="types index.js esm cjs es.js"
