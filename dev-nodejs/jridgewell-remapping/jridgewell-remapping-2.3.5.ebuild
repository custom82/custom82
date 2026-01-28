# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@jridgewell/remapping"
inherit npm

DESCRIPTION="Remap sequential sourcemaps through transformations to point at the original source code"
HOMEPAGE="https://github.com/jridgewell/sourcemaps"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/jridgewell-gen-mapping
        dev-nodejs/jridgewell-trace-mapping
"
