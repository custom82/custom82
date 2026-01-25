# Copyright 1999-2018 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=8

NPM_MODULE="is-core-module"
inherit npm

DESCRIPTION="Is this specifier a node.js core module? Optionally provide a node version to check; defaults to the current node version"
HOMEPAGE="https://github.com/inspect-js/is-core-module"

LICENSE="MIT"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
        dev-nodejs/hasown
"


