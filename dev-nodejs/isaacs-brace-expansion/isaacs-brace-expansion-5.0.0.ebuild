# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="@isaacs/brace-expansion"
inherit npm

DESCRIPTION="A hybrid CJS/ESM TypeScript fork of brace-expansion"
HOMEPAGE="https://www.npmjs.com/package/@isaacs/brace-expansion"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/isaacs-balanced-match
"
