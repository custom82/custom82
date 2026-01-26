# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="pkg-types"
inherit npm

DESCRIPTION="Node.js utilities and TypeScript definitions for package.json, tsconfig.json, and other configuration files"
HOMEPAGE="https://github.com/unjs/pkg-types"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/confbox
        dev-nodejs/exsolve
        dev-nodejs/pathe

"
