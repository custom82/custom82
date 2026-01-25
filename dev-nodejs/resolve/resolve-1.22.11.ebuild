# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="resolve"
inherit npm

DESCRIPTION="implements the node require.resolve() algorithm such that you can require.resolve() on behalf of a file asynchronously and synchronously"
HOMEPAGE="https://github.com/browserify/resolve"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/is-core-module
        dev-nodejs/path-parse
        dev-nodejs/supports-preserve-symlinks-flag
"


