# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="lightningcss"
inherit npm

DESCRIPTION="An extremely fast CSS parser, transformer, and minifier written in Rust"
HOMEPAGE="https://github.com/parcel-bundler/lightningcss"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/detect-libc
"
