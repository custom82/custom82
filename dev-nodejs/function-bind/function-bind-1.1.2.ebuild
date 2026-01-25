# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="function-bind"
inherit npm

DESCRIPTION="Implementation of function.prototype.bind"
HOMEPAGE="https://github.com/Raynos/function-bind"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

NPM_EXTRA_FILES="index.js implementation.js"
